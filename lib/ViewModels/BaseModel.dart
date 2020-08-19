import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseModel with ChangeNotifier {
  // search value from homepage
  var userEmail;
  var userId;
  var listener;
  bool netStat;
  bool placeRequest = false;
  String radioListValue = 'blue';
  String themeValue = 'blue';
  Color _color1;
  Color _color2;
  Color _color3;
  Color _color4;
  var jobType;
  var jobId;
  var disableLogin = false;
  List patient;
  var patientData;
  var dataBaseImageFile;
  var pageSelect;


  get color => _color1;

  get color2 => _color2;

  get color3 => _color3;

  get color4 => _color4;

  final Geolocator geoLocator = Geolocator()..forceAndroidLocationManager;

  Position currentPosition;
  String currentAddress;


  savePatientData(value) {
    patientData = value;
  }

  saveImageFile(value){
    dataBaseImageFile=value;
    notifyListeners();
  }

  saveSelectedPage(value){
    pageSelect=value;
    notifyListeners();
  }

// save patient list

  savePatientList(value) async {
    SharedPreferences savePatient = await SharedPreferences.getInstance();
    savePatient.setStringList('patient', value);
    notifyListeners();
  }

  getPatientList() async {
    SharedPreferences savePatient = await SharedPreferences.getInstance();
    patient = savePatient.getStringList('patient');
    notifyListeners();
    notifyListeners();
  }


//
  saveThemeValue(value) async {
    SharedPreferences theme = await SharedPreferences.getInstance();
    theme.setString('themeValue', value);
    notifyListeners();
  }

  saveJobType(value) async {
    SharedPreferences saveJobType = await SharedPreferences.getInstance();
    saveJobType.setString('jobType', value);
    notifyListeners();
  }

  getJobType() async {
    SharedPreferences saveJobType = await SharedPreferences.getInstance();
    jobType = saveJobType.getString('jobType') ?? 'No value yet';
    notifyListeners();
  }

  getJobId() async {
    SharedPreferences saveJobType = await SharedPreferences.getInstance();
    jobId = saveJobType.getString('jobId') ?? 'No value yet';
    notifyListeners();
  }

  setThemeValue() async {
    SharedPreferences theme = await SharedPreferences.getInstance();
    themeValue = theme.getString('themeValue') ?? 'blue';
    notifyListeners();
    radioListValue = theme.getString('themeValue') ?? 'blue';
    notifyListeners();
    themeValue == 'red' ? _color1 = Color.fromRGBO(217, 0, 27, 1.0) :
    _color1 = Color.fromRGBO(50, 0, 150, 1.0);
    notifyListeners();
    themeValue == 'red' ? _color2 = Color.fromRGBO(238, 83, 79, 1.0) :
    _color2 = Color.fromRGBO(3, 15, 117, 1.0);
    notifyListeners();
    themeValue == 'red' ? _color3 = Color.fromRGBO(248, 137, 121, 1.0) :
    _color3 = Color.fromRGBO(121, 137, 248, 1.0);
    notifyListeners();
    themeValue == 'red' ? _color4 = Color.fromRGBO(190, 0, 14, 1.0) :
    _color4 = Color.fromRGBO(14, 0, 190, 1.0);
    notifyListeners();
    print('this is the new thene $themeValue');
    print('this is the new radioListValue: $radioListValue');
  }

  notify() {
    notifyListeners();
  }


  setPlaceRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('placeRequest', true);
  }

  defaultPlaceRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('placeRequest', false);
  }

  updatePlaceRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    placeRequest = prefs.getBool('placeRequest') ?? false;
    notifyListeners();
  }

  bool profilePage;

  setUserEmail(email) {
    userEmail = email;
    notifyListeners();
  }

  getUserId(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserId', value);
  }

  setUserIdNull() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserId', null);
    notifyListeners();
  }

  setUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('UserId');
    notifyListeners();
  }

  networkConnection() {
    return listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          netStat = true;
          notifyListeners();
          return netStat;
          break;
        case DataConnectionStatus.disconnected:
          netStat = false;
          notifyListeners();
          return netStat;
          break;
      }
      return netStat;
    });
  }


  var imagePicked;
  var pendingCount = 0;
  var imageFile;
  var loadingPath;
  var imagePath;
  String extension;

  bool get mounted => imageFile != null;

  openFileExplorerImage() async {
    loadingPath = true;
    notifyListeners();
    try {
      imagePath = await FilePicker.getFilePath(
          type: FileType.image,
          allowedExtensions: (extension?.isNotEmpty ?? false)
              ? extension?.replaceAll(' ', '')?.split(',')
              : null);
      notifyListeners();
      imageFile = File(imagePath);
      SharedPreferences imagePrefs = await SharedPreferences.getInstance();
      imagePrefs.setString('imagePath', imagePath);
      notifyListeners();
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  loadImage() async {
    SharedPreferences imagePrefs = await SharedPreferences.getInstance();
    imagePrefs.getString('imagePath') != null ?
    imageFile = File(imagePrefs.getString('imagePath') ?? '') : null;
    notifyListeners();
  }

  setImageFileNull() async {
    SharedPreferences imagePrefs = await SharedPreferences.getInstance();
    imagePrefs.setString('imagePath', null);
  }

  getCurrentLocation() {
    geoLocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {

        currentPosition = position;
      notifyListeners();

     getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geoLocator.placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = p[0];


       currentAddress =
        "${place.locality}, ${place.country}";
    notifyListeners();
    } catch (e) {
      print(e);
    }
  }



}