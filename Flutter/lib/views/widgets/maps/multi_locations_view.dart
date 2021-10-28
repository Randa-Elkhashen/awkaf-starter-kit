import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/view_models/place.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/style/map_themes.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MultiLocationsView extends StatefulWidget {
  final List<Place> places;
  final LatLng? initialCameraPosition;
  const MultiLocationsView({
    Key? key,
    required this.places,
    this.initialCameraPosition,
  }) : super(key: key);

  @override
  _MultiLocationsViewState createState() => _MultiLocationsViewState();
}

class _MultiLocationsViewState extends State<MultiLocationsView> {
  late ClusterManager _manager;
  GoogleMapController? _googleMapController;
  late SettingProvider _settingProvider;
  Set<Marker> _markers = Set();

  _updateCamera(LatLng location) {
    _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: location,
        zoom: 14,
      ),
    ));
  }

  _changeTheme() async {
    switch (_settingProvider.themeMode) {
      case ThemeMode.light:
        await _googleMapController!.setMapStyle(MapThemes.light);
        break;
      case ThemeMode.dark:
        await _googleMapController!.setMapStyle(MapThemes.dark);
        break;
      default:
        if (AppStyle.mediaQueryData?.platformBrightness == Brightness.dark) {
          await _googleMapController!.setMapStyle(MapThemes.dark);
        } else {
          await _googleMapController!.setMapStyle(MapThemes.light);
        }
        break;
    }
    setState(() {});
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder => (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  ClusterManager<Place> _initClusterManager() {
    return ClusterManager<Place>(widget.places, _updateMarkers, markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this._markers = markers;
    });
  }

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _settingProvider = Provider.of<SettingProvider>(context, listen: false);
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: widget.initialCameraPosition ?? LatLng(26.8206, 30.8025),
        zoom: 10,
      ),
      markers: _markers,
      onCameraMove: _manager.onCameraMove,
      onCameraIdle: _manager.updateMap,
      onMapCreated: (GoogleMapController controller) {
        _googleMapController = controller;
        _manager.setMapId(controller.mapId);
        _changeTheme();
      },
    );
  }

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Theme.of(context).colorScheme.primary;
    final Paint paint2 = Paint()..color = Theme.of(context).colorScheme.onPrimary;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(fontSize: size / 3, color: Colors.white, fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
