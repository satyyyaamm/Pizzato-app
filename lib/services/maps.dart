import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as geoco;
import 'package:geolocator/geolocator.dart';

String finalAddress = 'Searching address..';

class GenerateMaps extends ChangeNotifier {
  Position position;
  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final coordinates =
        geoco.Coordinates(positionData.latitude, positionData.longitude);
    var address =
        await geoco.Geocoder.local.findAddressesFromCoordinates(coordinates);
    String mainAddress = address.first.addressLine;
    print(mainAddress);
    finalAddress = mainAddress;
    notifyListeners();
  }
}
