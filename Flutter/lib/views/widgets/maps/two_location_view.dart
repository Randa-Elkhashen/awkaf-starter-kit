import 'package:flutter/material.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/style/map_themes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
class TwoLocationView extends StatefulWidget  {
  final LatLng startLocation;
  final LatLng endLocation;

  const TwoLocationView({
    Key? key,
    required this.startLocation,
    required this.endLocation,
  }) : super(key: key);

  @override
  _TwoLocationViewState createState() => _TwoLocationViewState();
}

class _TwoLocationViewState extends State<TwoLocationView> {

  GoogleMapController? _googleMapController;
  late SettingProvider _settingProvider;

  /// update camera zoom, position depend on LatLngBounds
  _updateCamera(){
    // Calculating to check that the position relative
    // to the frame, and pan & zoom the camera accordingly.
    double miny = (widget.startLocation.latitude <= widget.endLocation.latitude)
        ? widget.startLocation.latitude
        : widget.endLocation.latitude;
    double minx = (widget.startLocation.longitude <= widget.endLocation.longitude)
        ? widget.startLocation.longitude
        : widget.endLocation.longitude;
    double maxy = (widget.startLocation.latitude <= widget.endLocation.latitude)
        ? widget.endLocation.latitude
        : widget.startLocation.latitude;
    double maxx = (widget.startLocation.longitude <= widget.endLocation.longitude)
        ? widget.endLocation.longitude
        : widget.startLocation.longitude;

    double southWestLatitude = miny;
    double southWestLongitude = minx;

    double northEastLatitude = maxy;
    double northEastLongitude = maxx;

    // Accommodate the two locations within the
    // camera view of the map
    _googleMapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(northEastLatitude, northEastLongitude),
          southwest: LatLng(southWestLatitude, southWestLongitude),
        ),
        100.0,
      ),
    );
  }

  /// change map theme
  _changeTheme() async {
    switch(_settingProvider.themeMode){
      case ThemeMode.light:
        await _googleMapController!.setMapStyle(MapThemes.light);
        break;
      case ThemeMode.dark:
        await _googleMapController!.setMapStyle(MapThemes.dark);
        break;
      default:
        if(AppStyle.mediaQueryData.platformBrightness == Brightness.dark){
          await _googleMapController!.setMapStyle(MapThemes.dark);
        }else {
          await _googleMapController!.setMapStyle(MapThemes.light);
        }
        break;
    }
    if(this.mounted)
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _settingProvider = Provider.of<SettingProvider>(context,listen: false);
    if(_googleMapController != null){
      _updateCamera();
    }
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(26.8206,30.8025),
        zoom: 5.5,
      ),
      polylines: {
        Polyline(
          polylineId: PolylineId("PolylineId"),
          //jointType: JointType.bevel,
          width: 5,
          geodesic: true,
          points: [widget.startLocation,widget.endLocation],
          color: Colors.blue,
        )
      },
      markers:{
        Marker(
            markerId: MarkerId("start_marker"),
            infoWindow: InfoWindow(
              title: "start location",
              snippet: "description"
            ),
            position: widget.startLocation
        ),
        Marker(
            markerId: MarkerId("end_marker"),
            infoWindow: InfoWindow(
              title: "end location",
              snippet: "description"
            ),
            position: widget.endLocation
        )
      },
      onMapCreated: (GoogleMapController controller) {
        _googleMapController = controller;
        _changeTheme();
        _updateCamera();
      },
    );
  }
}
