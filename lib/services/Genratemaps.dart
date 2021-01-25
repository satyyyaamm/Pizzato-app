import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as geoco;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GenerateMaps extends ChangeNotifier {
  Position position;
  Position get getPosition => position;
  String finalAddress = 'Searching address..';
  String get getFinalAddress => finalAddress;
  GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String countryName, mainAddress = 'Searching Address...';
  String get getCountryName => countryName;
  String get getMainAddress => mainAddress;

  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final coordinates =
        geoco.Coordinates(positionData.latitude, positionData.longitude);
    var address =
        await geoco.Geocoder.local.findAddressesFromCoordinates(coordinates);
    String mainAddress = address.first.addressLine;
    print(mainAddress);
    mainAddress = mainAddress;
    notifyListeners();
  }

  getMarker(double lat, double lng) {
    MarkerId markerId = MarkerId(lat.toString() + lng.toString());
    Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: 'My Title', snippet: 'Country Name'),
    );
    markers[markerId] = marker;
  }

  Widget fetchLocation() {
    return GoogleMap(
      mapType: MapType.hybrid,
      mapToolbarEnabled: true,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onTap: (loc) async {
        final cords = geoco.Coordinates(loc.latitude, loc.longitude);
        var address =
            await geoco.Geocoder.local.findAddressesFromCoordinates(cords);
        countryName = address.first.countryName;
        mainAddress = address.first.addressLine;
        markers.isEmpty
            ? getMarker(loc.latitude, loc.longitude)
            : markers.clear();
        print(loc);
        notifyListeners();
      },
      markers: Set<Marker>.of(markers.values),
      onMapCreated: (GoogleMapController mapController) {
        googleMapController = mapController;
        notifyListeners();
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(21.000, 45.000),
        zoom: 18,
      ),
    );
  }
}
