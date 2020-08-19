import 'dart:convert';

import 'package:age/age.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:hackthon/Model/dateTime.dart';
import 'package:hackthon/ViewModels/BaseModel.dart';

class AddCardViewModel extends BaseModel{
  int cameraOcr = FlutterMobileVision.CAMERA_BACK;
   bool _autoFocusOcr = true;
   bool _torchOcr = false;
   bool _multipleOcr = true;
   bool _waitTapOcr = false;
   bool _showTextOcr = true;
   Size previewOcr;
  List<OcrText> textsOcr = [];
  Map dataEntry=Map();
  Map dataEntryFromDatabase;
  List dataEntryKey;
  List dataEntryValue;

  get mounted=>textsOcr!=[];

  Future<Null> read() async {
    FlutterMobileVision.start().then((previewSizes) {

      previewOcr = previewSizes[cameraOcr].first;
      notifyListeners();});
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        flash: _torchOcr,
        autoFocus: _autoFocusOcr,
        multiple: _multipleOcr,
        waitTap: _waitTapOcr,
        showText: _showTextOcr,
        camera: cameraOcr,
        fps: 2.0,
      );
    } on Exception {
      texts.add(OcrText('Failed to recognize text.'));
    }

    if (!mounted) return;

    textsOcr = texts;
    notifyListeners();
  }




  updateMap(key, value) async {
    dataEntry[key]=value;
    notifyListeners();
    await Firestore.instance
        .collection(jobType)
        .document(jobId).setData({
      patientData['userName']:{
        currentDate('full date'):dataEntry
      }
    });
  }

  saveDataEntryMap(value){
    dataEntryFromDatabase=value;
    notifyListeners();
  }

  undoSelection(list,key,item){
    list.insert(key,item);
    notifyListeners();
  }

  removeListItem(List list,item){
    list.remove(item);
    notifyListeners();
  }

  removeOcrItem(item){
    textsOcr.remove(item);
    notifyListeners();
  }
  removeDataEntryKey(key){
    dataEntry.remove(key);
    notifyListeners();
  }

  validateData(formKey,formKey2,key,value){
    if(formKey.currentState.validate() && formKey2.currentState.validate()){
      updateMap(key, value);
      notifyListeners();
    }
  }

  getListFromDataEntryFromDatabase(){
     dataEntryFromDatabase.forEach((key, value) {
       dataEntryKey.add(key);
       notifyListeners();
       dataEntryValue.add(value);
       notifyListeners();
       dataEntryValue.forEach((element) {

       });
     });
  }


 getAge(){
    var ageData=json.decode(patientData['dob']);

   DateTime birthday = DateTime(ageData[0],ageData[1],ageData[2]);
   DateTime today = DateTime.now(); //2020/1/24

   AgeDuration age;

   // Find out your age
   age = Age.dateDifference(
       fromDate: birthday, toDate: today, includeToDate: false);

    return age;// Your
 }

  calculateAverage(){
    var myElement=0;
    dataEntryFromDatabase.keys.where((element) =>element=='Weight').forEach((element) {
      myElement=myElement+element;
    });
    return myElement;
  }
}