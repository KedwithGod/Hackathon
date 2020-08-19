import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/Model/dateTime.dart';
import 'package:hackthon/ViewModels/BaseModel.dart';
import 'package:hackthon/ViewModels/addCardViewModel.dart';
import 'package:hackthon/Views/growthMonitoringPage/addCardDetails.dart';
import 'package:hackthon/Views/growthMonitoringPage/selectPatientPage.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:random_string/random_string.dart';

import 'growthMeasuremet.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Widget listTile(title, text2, press) {
      return Container(
        height: height * (180 / 667),
        width: width * (290 / 375),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(height * (20 / 667)))),
        child: Stack(
          children: <Widget>[
            AdaptivePositioned(
              left: 22,
              top: 23,
              child: GeneralTextDisplay(
                  '$title',
                  Color.fromRGBO(0, 0, 191, 1.0),
                  1,
                  20,
                  FontWeight.bold,
                  '$title'),
            ),
            AdaptivePositioned(
              left: 22,
              top: 62,
              child: Container(
                height: height * (54 / 667),
                width: width * (259 / 375),
                child: GeneralTextDisplay(
                    '$text2',
                    Color.fromRGBO(51, 51, 51, 1.0),
                    5,
                    15,
                    FontWeight.w400,
                    '$text2'),
              ),
            ),
            AdaptivePositioned(
              left: 22,
              top: 136,
              child: GestureDetector(
                onTap: press,
                child: GeneralTextDisplay(
                    'Open Page',
                    Color.fromRGBO(77, 45, 164, 1.0),
                    1,
                    15,
                    FontWeight.w600,
                    'open page'),
              ),
            ),
          ],
        ),
      );
    }

    return ViewModelProvider<BaseModel>.withConsumer(
        onModelReady: (model) {
          model.networkConnection();
          model.setUserId();
          print(model.userId);
          model.getJobType();
          model.getJobId();
        },
        viewModelBuilder: () => BaseModel(),
        disposeViewModel: false,
        builder: (context, model, child) => WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: model.netStat == false
                  ? SafeArea(
                      child: Scaffold(
                        body: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/network.gif'),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Kindly switch on your data',
                                style: GoogleFonts.adamina(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : SafeArea(
                      child: Scaffold(
                      body: Stack(
                        children: <Widget>[
                          AdaptivePositioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              height: height * (294 / 667),
                              width: width,
                              color: Color.fromRGBO(20, 78, 162, 1.0),
                            ),
                          ),
                          AdaptivePositioned(
                            left: 0,
                            top: 294,
                            child: Container(
                              height: height * (373 / 667),
                              width: width,
                              color: Color.fromRGBO(10, 66, 149, 1.0),
                            ),
                          ),
                          AdaptivePositioned(
                            left: 20,
                            top: 18,
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: height * (23 / 667),
                                  color: Colors.white,
                                ),
                                onPressed: () {}),
                          ),
                          AdaptivePositioned(
                            left: 150,
                            top: 25,
                            child: GeneralTextDisplay('Today', Colors.white, 1,
                                20, FontWeight.w600, 'today'),
                          ),
                          AdaptivePositioned(
                            left: 310,
                            top: 18,
                            child: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: height * (23 / 667),
                                  color: Colors.white,
                                ),
                                onPressed: () {}),
                          ),
                          AdaptivePositioned(
                            left: 0,
                            top: 69,
                            child: Container(
                              height: height * (20 / 667),
                              width: width,
                              alignment: Alignment.center,
                              child: GeneralTextDisplay(
                                  currentDate('full date'),
                                  Color.fromRGBO(200, 200, 200, 1.0),
                                  1,
                                  15,
                                  FontWeight.w600,
                                  'today'),
                            ),
                          ),
                          AdaptivePositioned(
                            left: 0,
                            top: 140,
                            child: Container(
                              height: height * (265 / 667),
                              width: width,
                              alignment: Alignment.center,
                              child: Container(
                                height: height * (263 / 667),
                                width: width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(53, 134, 242, 1.0),
                                    shape: BoxShape.circle),
                                child: Container(
                                  height: height * (233 / 667),
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(28, 89, 182, 1.0),
                                      shape: BoxShape.circle),
                                  child: Stack(
                                    children: <Widget>[
                                      AdaptivePositioned(
                                        left: 125,
                                        top: 48,
                                        child: StreamBuilder(
                                            stream: Firestore.instance
                                                .collection(model.jobType)
                                                .document(model.jobId)
                                                .snapshots(),
                                            builder: (context, snapshot) {

                                              if (!snapshot
                                                  .hasData) {
                                                return GeneralTextDisplay(
                                                    '0 Patient',
                                                    Colors.white,
                                                    1,
                                                    20,
                                                    FontWeight.bold,
                                                    'no of patients');
                                              }

                                              if (snapshot.data.data!=null) {
                                                var value=snapshot.data;
                                              return GeneralTextDisplay(
                                                  '${value.data['totalNoOfPatients']} Patients',
                                                  Colors.white,
                                                  1,
                                                  20,
                                                  FontWeight.bold,
                                                  'no of patients');}
                                              return GeneralTextDisplay(
                                                  '0 Patient',
                                                  Colors.white,
                                                  1,
                                                  20,
                                                  FontWeight.bold,
                                                  'no of patients');
                                            }),
                                      ),
                                      AdaptivePositioned(
                                        left: 97,
                                        top: 95,
                                        child: Container(
                                          height: height * (8 / 667),
                                          width: width * (180 / 375),
                                          alignment: Alignment.center,
                                          color:
                                              Color.fromRGBO(18, 77, 157, 1.0),
                                        ),
                                      ),
                                      AdaptivePositioned(
                                        left: 180,
                                        top: 102,
                                        child: Container(
                                          height: height * (108 / 667),
                                          width: width * (8 / 375),
                                          alignment: Alignment.center,
                                          color:
                                              Color.fromRGBO(18, 77, 157, 1.0),
                                        ),
                                      ),
                                      AdaptivePositioned(
                                        left: 110,
                                        top: 122,
                                        child: StreamBuilder(
                                          stream: Firestore.instance
                                              .collection(model.jobType)
                                              .document(model.jobId)
                                              .snapshots(),
                                          builder: (context, snapshot) {

                                            if (!snapshot
                                                .hasData) {
                                              return GeneralTextDisplay(
                                                  '0',

                                                  Colors.white,
                                                  1,
                                                  15,
                                                  FontWeight.w800,
                                                  'children');
                                            }

                                            if (snapshot.data.data!= null) {
                                              var value=snapshot.data;
                                              model.savePatientList(value.data['patient']);
                                              return GeneralTextDisplay(
                                                  '${value.data['children'].length}',

                                                  Colors.white,
                                                  1,
                                                  15,
                                                  FontWeight.w800,
                                                  'children');}
                                            return GeneralTextDisplay(
                                                '0',

                                                Colors.white,
                                                1,
                                                15,
                                                FontWeight.w800,
                                                'children');
                                          }
                                        ),
                                      ),
                                      AdaptivePositioned(
                                        left: 95,
                                        top: 140,
                                        child: GeneralTextDisplay(
                                            'Children',
                                            Color.fromRGBO(200, 200, 200, 1.0),
                                            2,
                                            14,
                                            FontWeight.w600,
                                            'today'),
                                      ),
                                      AdaptivePositioned(
                                        left: 220,
                                        top: 122,
                                        child: StreamBuilder(
                                          stream: Firestore.instance
                                              .collection(model.jobType)
                                              .document(model.jobId)
                                              .snapshots(),
                                          builder: (context, snapshot) {

                                            if (!snapshot
                                                .hasData) {
                                              return GeneralTextDisplay(
                                                  '0',

                                                  Colors.white,
                                                  1,
                                                  15,
                                                  FontWeight.w800,
                                                  'pregnant woman');
                                            }

                                            if (snapshot.data.data !=null) {
                                              var value=snapshot.data;
                                              return GeneralTextDisplay(
                                                  '${value.data['pregnantWoman'].length}',

                                                  Colors.white,
                                                  1,
                                                  15,
                                                  FontWeight.w800,
                                                  'pregnant woman');}
                                            return GeneralTextDisplay(
                                                '0',

                                                Colors.white,
                                                1,
                                                15,
                                                FontWeight.w800,
                                                'pregnant woman');
                                          }
                                        ),
                                      ),
                                      AdaptivePositioned(
                                        left: 201,
                                        top: 140,
                                        child: GeneralTextDisplay(
                                            'Pregnant',
                                            Color.fromRGBO(200, 200, 200, 1.0),
                                            1,
                                            14,
                                            FontWeight.w600,
                                            'today'),
                                      ),
                                      AdaptivePositioned(
                                        left: 205,
                                        top: 158,
                                        child: GeneralTextDisplay(
                                            'Woman',
                                            Color.fromRGBO(200, 200, 200, 1.0),
                                            1,
                                            14,
                                            FontWeight.w600,
                                            'today'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              left: width * (14 / 375),
                              top: height * (432 / 667),
                              right: width * (14 / 375),
                              bottom: height * (20 / 667),
                              child: SizedBox(
                                  height: height * (189 / 667),
                                  child: ListView(
                                      key: Key(randomString(8)),
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        listTile('Growth Determination',
                                            'Determine child\'s growth using charts and graphs',
                                            () {
                                              model.saveSelectedPage('growthMeasurement');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SelectPatient()));
                                        }),
                                        SizedBox(
                                          width: width * (19 / 375),
                                        ),
                                        listTile('Add Patient card',
                                            'Scan Patient card and save to the app, or enter patient details for patient without card',
                                            () {
                                          model.saveSelectedPage('addCard');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SelectPatient()));
                                        }),
                                        SizedBox(
                                          width: width * (19 / 375),
                                        ),
                                        listTile('Malnutrition Prevention',
                                            'Using food record data to determine malnutrition in a child',
                                            () {
                                              model.saveSelectedPage('malnutrition');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddCardDetails()));
                                        })
                                      ])))
                        ],
                      ),
                    )),
            ));
  }
}
