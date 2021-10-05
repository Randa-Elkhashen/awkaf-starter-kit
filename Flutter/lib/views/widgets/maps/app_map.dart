import 'package:flutter/material.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/style/map_themes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
class AppMap extends StatefulWidget  {
  final LatLng? markLocation;
  const AppMap({
    Key? key,
    this.markLocation,
  }) : super(key: key);

  @override
  _AppMapState createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> with WidgetsBindingObserver  {
  GoogleMapController? _googleMapController;
  late SettingProvider _settingProvider;

  _updateCamera(LatLng location){
    _googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: location,
            zoom: 14,
          ),
        )
    );
  }

  _changeTheme() async {
    switch(_settingProvider.themeMode){
      case ThemeMode.light:
        await _googleMapController!.setMapStyle(MapThemes.light);
        break;
      case ThemeMode.dark:
        await _googleMapController!.setMapStyle(MapThemes.dark);
        break;
      default:
        if(AppStyle.mediaQueryData?.platformBrightness == Brightness.dark){
          await _googleMapController!.setMapStyle(MapThemes.dark);
        }else {
          await _googleMapController!.setMapStyle(MapThemes.light);
        }
        break;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    _changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _settingProvider = Provider.of<SettingProvider>(context,listen: false);
    if(_googleMapController != null && widget.markLocation != null){
      _updateCamera(widget.markLocation!);
    }
    return GoogleMap(
      mapType: MapType.normal,

      initialCameraPosition: CameraPosition(
        target: widget.markLocation ?? LatLng(26.8206,30.8025),
        zoom: 14,
      ),
      markers: widget.markLocation == null ? {} :
      {
        Marker(
            markerId: MarkerId("MarkerId"),
            position: widget.markLocation!
        )
      },
      onMapCreated: (GoogleMapController controller) {
        _googleMapController = controller;
        _changeTheme();
      },
    );
  }
}
