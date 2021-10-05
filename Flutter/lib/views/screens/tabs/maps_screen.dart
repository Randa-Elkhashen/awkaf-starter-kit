import 'package:flutter/material.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';
import 'package:flutter_app/views/widgets/maps/app_location_picker.dart';
import 'package:flutter_app/views/widgets/maps/app_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  LatLng? _location;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SizedBox(
          height: AppStyle.size.shortestSide,
          width: AppStyle.size.shortestSide,
          child: AppMap(markLocation: _location,)
        ),
        SizedBox(height: 16 * AppStyle.scaleFactor,),
        AppButton(
          text: "Pick Location",
          onPressed: () async {
            LatLng? _temp = await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_)=> AppLocationPicker()
              )
            ) as LatLng?;
            if(_temp != null){
              _location = _temp;
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
