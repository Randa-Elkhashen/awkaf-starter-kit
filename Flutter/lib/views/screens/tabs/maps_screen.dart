import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/place.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/buttons/app_button.dart';
import 'package:flutter_app/views/widgets/maps/app_location_picker.dart';
import 'package:flutter_app/views/widgets/maps/location_view.dart';
import 'package:flutter_app/views/widgets/maps/multi_locations_view.dart';
import 'package:flutter_app/views/widgets/maps/two_location_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {

  LatLng? _location;

  List<Place> items = [
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Place $i',
          latLng: LatLng(48.848200 + i * 0.001, 2.319124 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Restaurant $i',
          latLng: LatLng(48.858265 - i * 0.001, 2.350107 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Bar $i',
          latLng: LatLng(48.858265 + i * 0.01, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Hotel $i',
          latLng: LatLng(48.858265 - i * 0.1, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test $i',
          latLng: LatLng(66.160507 + i * 0.1, -153.369141 + i * 0.1)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test2 $i',
          latLng: LatLng(-36.848461 + i * 1, 169.763336 + i * 1)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SizedBox(
          height: AppStyle.size.shortestSide,
          width: AppStyle.size.shortestSide,
          child: LocationView(markLocation: _location,)
        ),
        //SizedBox(height: 16 * AppStyle.scaleFactor,),
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
        SizedBox(height: 16 * AppStyle.scaleFactor,),
        SizedBox(
            height: AppStyle.size.shortestSide,
            width: AppStyle.size.shortestSide,
            child: MultiLocationsView(
              places: items,
              initialCameraPosition: LatLng(48.75449875000001, 2.32211125),
            )
        ),
        AppButton(
          text: "Test in Full Screen",
          onPressed: () async {
            LatLng? _temp = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_)=> Scaffold(
                      body:SizedBox.expand(
                          child: MultiLocationsView(
                            places: items,
                            initialCameraPosition: LatLng(48.75449875000001, 2.32211125),
                          )
                      ),
                    )
                )
            ) as LatLng?;
            if(_temp != null){
              _location = _temp;
              setState(() {});
            }
          },
        ),
        SizedBox(height: 16 * AppStyle.scaleFactor,),
        SizedBox(
          height: AppStyle.size.shortestSide,
          width: AppStyle.size.shortestSide,
          child: TwoLocationView(
            startLocation: LatLng(48.848200, 2.319124 ),
            endLocation: LatLng(48.848200 , 10.319124),
          ),
        ),
        AppButton(
          text: "Test in Full Screen",
          onPressed: () async {
            LatLng? _temp = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_)=> Scaffold(
                      body:SizedBox.expand(
                          child:TwoLocationView(
                            startLocation: LatLng(48.848200, 2.319124 ),
                            endLocation: LatLng(48.848200 , 30.319124),
                          ),
                      ),
                    )
                )
            ) as LatLng?;
            if(_temp != null){
              _location = _temp;
              setState(() {});
            }
          },
        ),
        SizedBox(height: 16 * AppStyle.scaleFactor,),
      ],
    );
  }
}
