import 'package:flutter/material.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/style/map_themes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
class LocationView extends StatefulWidget  {
  final LatLng? markLocation;
  const LocationView({
    Key? key,
    this.markLocation,
  }) : super(key: key);

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {

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
    _googleMapController?.showMarkerInfoWindow(MarkerId("MarkerId"));
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
    if(_googleMapController != null && widget.markLocation != null){
      _updateCamera(widget.markLocation!);
    }
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: widget.markLocation ?? LatLng(26.8206,30.8025),
        zoom: 5.5,
      ),
      markers: widget.markLocation == null ? {} :
      {
        Marker(
            markerId: MarkerId("MarkerId"),

            infoWindow: InfoWindow(
              title: "location name",
              snippet: "description"
            ),
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
