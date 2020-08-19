

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackthon/Views/growthMonitoringPage/addCardDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dateTime.dart';

class FireStoreServices{
  // To save if your a mother or health worker
  userData(
      userType
      ) async{
    await Firestore.instance.collection('Users').document(userType).setData({

      userType : FieldValue.increment(1)},merge: true);
  }


// To save if you are a midwife or health care worker

 midWivesDataBase (
     String userName,String age,location,
     gender,imageFile,
     registrationDocument,jobType,context
     ) async{
   try{
     var val=await Firestore.instance.collection(jobType).
     add({
     'jobType': jobType,
     'userName':userName,
     'age':age,
       'imageFile':imageFile,
     'location':location,
       'gender':gender,
     'registrationDocument':registrationDocument,
     'time of Registration':currentTime(),
     'date of Registration':currentDate('full date'),
   },);
     var getDoc=val.documentID;

       SharedPreferences saveJobType= await SharedPreferences.getInstance();
       saveJobType.setString('jobId', getDoc);
     await Firestore.instance.collection('HealthCareWorker').document(jobType).setData({

        jobType : FieldValue.increment(1)},merge: true);

   }catch(e){
   return showDialog(
   context: context,
   builder: (context){
   return AlertDialog(
   backgroundColor: Colors.white,
   content: Text(e.toString(),style: TextStyle(color: Colors.black),),
   actions: [InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(
   builder: (context)=>AddCardDetails()));},
   child: Text('Close', style: TextStyle(color:Colors.black),))],
   )
   ;});
   }

}

// save pregnant mother or child dataBase

  motherChildDataBase (
      jobType,jobTypeId,
      String userName,dateOfBirth,gender,location,
      imageFile,
      registrationDocument,userType,context
      ) async{
    try{
      var val=await Firestore.instance.collection('patient').
      add({
        'userType': userType,
        if (userType=='children') 'dob':dateOfBirth,
        if (userType=='children') 'gender':gender,
        'userName':userName,
        'imageFile':imageFile,
        'location':location,

        'time of Registration':currentTime(),
        'date of Registration':currentDate('full date'),
      },);
      var getDoc=val.documentID;
      await Firestore.instance.collection(jobType).document(jobTypeId).setData({
        'patient':[getDoc],
        userType:[getDoc],
        'totalNoOfPatients': FieldValue.increment(1)
      },merge: true);

      await Firestore.instance.collection('User').document(userType).setData({
        userType : FieldValue.increment(1)},merge: true);

    }catch(e){
      return showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Text(e.toString(),style: TextStyle(color: Colors.black),),
              actions: [InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>AddCardDetails()));},
                  child: Text('Close', style: TextStyle(color:Colors.black),))],
            )
            ;});
    }

  }

}