import 'package:flutter/cupertino.dart';

class Calculations extends ChangeNotifier {
  int cheeseValue = 0, beaconValue = 0, paneerValue = 0;

  get getCheeseValue => cheeseValue;
  get getBeaconValue => beaconValue;
  get getPaneerValue => paneerValue;

  addCheese() {
    if (cheeseValue != 5) {
      cheeseValue++;
    }
    notifyListeners();
  }

  removeCheese() {
    if (cheeseValue != 0) {
      cheeseValue--;
    }
    notifyListeners();
  }

  addBeacon() {
    if (beaconValue != 5) {
      beaconValue++;
    }
    notifyListeners();
  }

  removeBeacon() {
    if (beaconValue != 0) {
      beaconValue--;
    }
    notifyListeners();
  }

  addPaneer() {
    if (paneerValue != 5) {
      paneerValue++;
    }
    notifyListeners();
  }

  removePaneer() {
    if (paneerValue != 0) {
      paneerValue--;
    }
    notifyListeners();
  }

  resetall() {
    cheeseValue = 0;
    beaconValue = 0;
    paneerValue = 0;
  }
}
