import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import '../../services/location/locationservice.dart';

class SearchMap extends StatefulWidget {
  const SearchMap({super.key});

  @override
  State<SearchMap> createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  final LocationService locationService = LocationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  OpenStreetMapSearchAndPick(
            center: LatLong(23, 89),
            buttonColor: Colors.blue,
            buttonText: 'Set Current Location',
            onPicked: (pickedData) {
              print(pickedData.latLong.latitude);
              print(pickedData.latLong.longitude);
              print(pickedData.address);
            },
            onGetCurrentLocationPressed: locationService.getPosition,
        ),
    );
  }
}