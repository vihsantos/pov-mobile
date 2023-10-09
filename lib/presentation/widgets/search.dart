// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:pov/presentation/controllers/newpostpage_controller.dart';

import '../../models/localization_model.dart';

class Search extends StatefulWidget {
  final NewPostPageController controller;
  const Search({super.key, required this.controller});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Position? position;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getLocation();
    });
    super.initState();
  }

  getLocation() async {
    position = await widget.controller.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OpenStreetMapSearchAndPick(
      buttonTextStyle:
          const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
      center: const LatLong(-12.9704, -38.5124),
      buttonColor: Colors.blue,
      buttonText: 'Escolha a sua localização atual',
      onPicked: (pickedData) {
        print(pickedData.latLong.latitude);
        print(pickedData.latLong.longitude);
        print(pickedData.address);
        print(pickedData.addressName);

        widget.controller.novoPost.localization = LocalizationModel(
            lat: pickedData.latLong.latitude,
            long: pickedData.latLong.longitude,
            local: pickedData.addressName);
        Navigator.of(context).pop();
      },
    ));
  }
}
