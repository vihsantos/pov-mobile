// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:pov/presentation/controllers/newpostpage_controller.dart';

import '../../models/localization_model.dart';
import '../../repository/login_repository.dart';
import '../../services/singleton/auth_singleton.dart';

class Search extends StatefulWidget {
  final NewPostPageController controller;
  const Search({super.key, required this.controller});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Position? position;
  LatLng? location;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
    location = AuthSingleton(LoginRepository()).getLocalization();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OpenStreetMapSearchAndPick(
      buttonTextStyle:
          const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
      buttonColor: Colors.blue,
      buttonText: 'Escolha a sua localização atual',
      onPicked: (pickedData) {
        print(pickedData.latLong.latitude);
        print(pickedData.latLong.longitude);
        print(pickedData.address);
        print(pickedData.addressName);

        String pontoTuristico = "";

        if(pickedData.address["amenity"] != null){
          pontoTuristico = pickedData.address["amenity"] + ", ";
        }

        if(pickedData.address["tourism"] != null){
          

          if(pontoTuristico.isEmpty){
            pontoTuristico = pickedData.address["tourism"] + ", ";
          } else{
            pontoTuristico = pontoTuristico + pickedData.address["tourism"] + ", ";
          }
        }
        
        String endereco = pickedData.address["road"].toString() +", " + pickedData.address["city"].toString() + ", " + pickedData.address["state"].toString() + ", " + pickedData.address["postcode"].toString();

        if(pontoTuristico != ""){
          endereco = pontoTuristico + endereco;
        }

        setState(() {
          widget.controller.novoPost.localization = LocalizationModel(
            lat: pickedData.latLong.latitude,
            long: pickedData.latLong.longitude,
            local: endereco.toUpperCase());
        });
        Navigator.of(context).pop();
      },
    ));
  }
}
