import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/Model/dateTime.dart';
import 'package:hackthon/ViewModels/BaseModel.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/sizedBox.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:random_string/random_string.dart';

import 'addCardDetails.dart';
import 'growthMeasuremet.dart';

class SelectPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    listContainer(patient,model) {
      return AdaptiveSizedBox(
        height: (69 / 667),
        width: (334 / 375),
        child: GestureDetector(
          onTap: (){model.pageSelect=='addCard'?
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddCardDetails())):
          model.pageSelect=='growthMeasurement'?
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GrowthMeasurement(model.patientData['userName'],
                          model.patientData['imageFile']))):
          model.pageSelect=='malnutrition'?
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SelectPatient())) :
          null;
          },
          child: Material(
            elevation: 10.0,
            shadowColor: Color.fromRGBO(242, 242, 242, 1.0),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(height * (11 / 667))),
            child: Stack(
              children: <Widget>[
                AdaptivePositioned(
                  left: 15,
                  top: 10,
                  child: Container(
                      height: height * (50 / 667),
                      width: height * (50 / 667),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                         image: model.dataBaseImageFile!=null?DecorationImage
                            (image: FileImage(model.dataBaseImageFile,),fit: BoxFit.cover,)
                              :null,
                          shape: BoxShape.circle)),
                ),
                AdaptivePositioned(
                  left: 84,
                  top: 10,
                  child: StreamBuilder(
                    stream: Firestore.instance.collection('patient').document(patient).snapshots(),
                    builder: (context, snapshot) {
                      var value=snapshot.data;
                      model.saveImageFile(value.data['imageFile']);
                      model.savePatientData(value.data);
                      return GeneralTextDisplay(
                          model.patientData['userName'],
                          Color.fromRGBO(51, 51, 51, 1.0),
                          1,
                          17,
                          FontWeight.w600,
                          'name');
                    }
                  ),
                ),
                AdaptivePositioned(
                  left: 84,
                  top: 36,
                  child: GeneralTextDisplay(
                      model.patientData['gender'],
                      Color.fromRGBO(51, 51, 51, 1.0),
                      1,
                      13,
                      FontWeight.w400,
                      'male'),
                ),
              ],
            ),
          ),
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
          model.getPatientList();
          model.loadImage();
        },
        viewModelBuilder: () => BaseModel(),
        disposeViewModel: false,
        builder: (context, model, child) => model.netStat == false
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
                  backgroundColor: Colors.white,
                  body: Stack(
                    children: <Widget>[
                      AdaptivePositioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          height: height * (200 / 667),
                          width: width,
                          color: Color.fromRGBO(20, 78, 162, 1.0),
                          child: Stack(
                            children: <Widget>[
                              AdaptivePositioned(
                                left: 20,
                                top: 40,
                                child: Container(
                                  height: height * (44 / 667),
                                  width: width * (267 / 375),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(
                                          34, 99, 191, 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              height * (30 / 667)))),
                                  child: Stack(
                                    children: <Widget>[
                                      AdaptivePositioned(
                                        left: 20,
                                        top: 13,
                                        child: GeneralTextDisplay(
                                            'Search',
                                            Color.fromRGBO(
                                                242, 242, 242, 1.0),
                                            1,
                                            16,
                                            FontWeight.w400,
                                            'search text'),
                                      ),
                                      AdaptivePositioned(
                                          left: 227,
                                          top: 12,
                                          child: GestureDetector(
                                            onTap: () {
                                              showSearch(context: context,
                                                  delegate:Search(model.patientData));
                                            },
                                            child: Icon(
                                                FontAwesomeIcons.search,
                                                size: height * (20 / 667),
                                                color: Color.fromRGBO(
                                                    242, 242, 242, 1.0)),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 300,
                        top: 37,
                        child: Container(
                            height: height * (50 / 667),
                            width: height * (50 / 667),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/mother.jpg'),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle)),
                      ),
                      AdaptivePositioned(
                        left: 20,
                        top: 114,
                        child: GeneralTextDisplay(
                            'My Patient',
                            Colors.white,
                            1,
                            16,
                            FontWeight.w600,
                            'my patient'),
                      ),
                      AdaptivePositioned(
                        left: 20,
                        top: 138,
                        child: StreamBuilder(
                            stream: Firestore.instance
                                .collection(model.jobType)
                                .document(model.jobId)
                                .snapshots(),
                            builder: (context, snapshot) {

                              if (!snapshot.hasData) {
                                return GeneralTextDisplay(
                                    '0',
                                    Colors.white,
                                    1,
                                    20,
                                    FontWeight.bold,
                                    'no of patients');
                              }

                              if (snapshot.data.data != null) {
                                var value = snapshot.data;
                                return GeneralTextDisplay(
                                    '${value.data['totalNoOfPatients']} Patients',
                                    Colors.white,
                                    1,
                                    20,
                                    FontWeight.bold,
                                    'no of patients');
                              }
                              return GeneralTextDisplay(
                                  '0',
                                  Colors.white,
                                  1,
                                  20,
                                  FontWeight.bold,
                                  'no of patients');
                            }),
                      ),
                      AdaptivePositioned(
                        left: 170,
                        top: 139,
                        child: GeneralTextDisplay(
                            currentDate('full date'),
                            Color.fromRGBO(215, 215, 215, 1.0),
                            1,
                            13,
                            FontWeight.w600,
                            'today'),
                      ),
                      AdaptivePositioned(
                        left: 20,
                        top: 221,
                        child: GeneralTextDisplay(
                            'Select Child Name',
                            Colors.black,
                            1,
                            16,
                            FontWeight.w400,
                            'search text'),
                      ),
                      AdaptivePositioned(
                          left: 315,
                          top: 220,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(FontAwesomeIcons.plus,
                                size: height * (20 / 667),
                                color: Colors.black),
                          )),
                      Positioned(
                          left: width * (20 / 375),
                          top: height * (260 / 667),
                          right: width * (20 / 375),
                          bottom: height * (20 / 667),
                          child: AdaptiveSizedBox(
                                  height: 189 / 667,
                                  child: ListView.builder(
                                      key: Key(randomString(8)),
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: model.patient==null?1:model.patient.length,
                                      shrinkWrap: true, itemBuilder: (BuildContext context, int index) {
                                        return model.patient==null?
                                        GeneralTextDisplay(
                                          'No Registered patient',
                                            Color.fromRGBO(20, 78, 162, 1.0),
                                          1,
                                          20,
                                            FontWeight.w500,
                                          'No data yet')
                                      :listContainer(model.patient[index],model);
                                  },
                                      )))

                    ],
                  ),
                ),
              ));
  }
}

class Search extends SearchDelegate{
  Map patientData;
  Search(this.patientData);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      progress:transitionAnimation, icon: AnimatedIcons.menu_arrow,

    ), onPressed: (){
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList=query.isEmpty?patientData==null?['No patient yet']:patientData['userName']:patientData==null?['No data']:patientData['userName'].where((element) =>
    element.startWith(query)).toList();
    final myList2=query.isEmpty?patientData==null?['No data']:patientData['gender']:patientData==null?['No data']:patientData['gender'].where((element) =>
        element.startWith(query)).toList();
    return ListView.builder(
        itemCount: myList.length,
        itemBuilder:(context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GeneralTextDisplay(
                    myList[index], Colors.black, 1, 20, FontWeight.w600,
                    '${myList[index]}'),
                GeneralTextDisplay(
                    myList2[index], Colors.grey, 1, 13, FontWeight.w400,
                    '${myList[index]}'),
                Divider()
              ],
            ),
          );
        });
  }

}