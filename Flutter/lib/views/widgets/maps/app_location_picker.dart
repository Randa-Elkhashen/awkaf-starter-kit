import 'package:flutter/material.dart';
import 'package:flutter_app/providers/setting_provider.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/style/map_themes.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
class AppLocationPicker extends StatefulWidget {
  final LatLng? initialCameraPosition;
  const AppLocationPicker({
    Key? key,
    this.initialCameraPosition,
  }) : super(key: key);

  @override
  _AppLocationPickerState createState() => _AppLocationPickerState();
}

class _AppLocationPickerState extends State<AppLocationPicker> {
  GoogleMapController? _googleMapController;
  late SettingProvider _settingProvider;
  Marker? _marker;

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

  _changeTheme(){
    switch(_settingProvider.themeMode){
      case ThemeMode.light:
        _googleMapController!.setMapStyle(MapThemes.light);
        break;
      case ThemeMode.dark:
        _googleMapController!.setMapStyle(MapThemes.dark);
        break;
      default:
        if(MediaQuery.of(context).platformBrightness == Brightness.dark){
          _googleMapController!.setMapStyle(MapThemes.dark);
        }else {
          _googleMapController!.setMapStyle(MapThemes.light);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _settingProvider = Provider.of<SettingProvider>(context,listen: false);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: widget.initialCameraPosition ?? LatLng(26.8206,30.8025),
              zoom: 6,
            ),
            onTap: (location){
              _updateCamera(location);
              _marker = Marker(
                markerId: MarkerId("selected location"),
                position: location,
              );
              setState(() {});
            },
            markers: _marker == null ? {} : {_marker!},
            onMapCreated: (GoogleMapController controller) {
              _googleMapController = controller;
              _changeTheme();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSwitcher(
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              duration: Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation){
                final  offsetAnimation =
                Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, -0.2)).animate(animation);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              child: _marker == null ? SizedBox.shrink() :
              Container(
                height: 100 * AppStyle.scaleFactor,
                margin: EdgeInsets.all(16),
                key: ValueKey(_marker!.position),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_marker!.position.toString()),
                    AppButton(
                      text: "Confirm",
                      onPressed: (){
                        Navigator.of(context).pop(_marker!.position);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
