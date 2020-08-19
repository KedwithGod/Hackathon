import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/Model/dateTime.dart';
import 'package:hackthon/ViewModels/addCardViewModel.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/sizedBox.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:random_string/random_string.dart';

class PreviousData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;




    return ViewModelProvider<AddCardViewModel>.withConsumer(
        onModelReady: (model) {
          model.networkConnection();
          model.setUserId();
          print(model.userId);
          model.getJobType();
          model.getJobId();
        },
        viewModelBuilder: () => AddCardViewModel(),
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
                backgroundColor: Color.fromRGBO(20, 78, 162, 1.0),
                body: Stack(
                  children: <Widget>[
                    AdaptivePositioned(
                      left: 24,
                      top: 20,
                      child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: height * (25 / 667),
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ),
                    AdaptivePositioned(
                      left: 124,
                      top: 29,
                      child: GeneralTextDisplay(
                          model.patientData!=null?model.patientData['userName']:'Patrick ivon',
                          Colors.white,
                          1,
                          20,
                          FontWeight.w600,
                          'patient name'),
                    ),
                    AdaptivePositioned(
                      left: 307,
                      top: 21,
                      child: Container(
                          height: height * (40 / 667),
                          width: height * (40 / 667),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              image: model.dataBaseImageFile!=null?DecorationImage
                                (image: FileImage(model.dataBaseImageFile,),fit: BoxFit.cover,)
                                  :null,
                              shape: BoxShape.circle)),
                    ),
                    AdaptivePositioned(
                      left: 24,
                      top: 86,
                      child: model.patientData==null?
                      GeneralTextDisplay(
                              'No data Available',
                              Colors.white,
                              1,
                              20,
                              FontWeight.w500,
                              '')
                          :AdaptiveSizedBox(
                        height: (236 / 667),
                        width: (326 / 375),
                        child: Material(
                          elevation: 1.0,
                          /*shadowColor: Color.fromRGBO(242, 242, 242, 1.0),*/
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(height * (20 / 667))),
                          child: Stack(
                            children: <Widget>[
                              AdaptivePositioned(
                                left: 25,
                                top: 20,
                                child: GeneralTextDisplay(
                                        'Weight',
                                        Color.fromRGBO(51, 51, 51, 1.0),
                                        1,
                                        14,
                                        FontWeight.w400,
                                        'weight')
                              ),
                              AdaptivePositioned(
                                left: 25,
                                top: 42,
                                child: StreamBuilder(
                                  stream: Firestore.instance
                                      .collection(model.jobType)
                                      .document(model.jobId).snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot
                                        .hasData) {
                                      return GeneralTextDisplay(
                                          '0',

                                          Color.fromRGBO(51, 51, 51, 1.0),
                                          1,
                                          16,
                                          FontWeight.bold,
                                          'month');
                                    }

                                    if (snapshot.data.data !=null) {
                                      var value=snapshot.data;
                                      model.saveDataEntryMap(value.data[ model.patientData['userName']]);
                                      return GeneralTextDisplay(
                                          '${value.data[ model.patientData['userName']].length}',

                                          Color.fromRGBO(51, 51, 51, 1.0),
                                          1,
                                          16,
                                          FontWeight.bold,
                                          'month');}
                                    return GeneralTextDisplay(
                                        '0',

                                        Color.fromRGBO(51, 51, 51, 1.0),
                                        1,
                                        16,
                                        FontWeight.bold,
                                        'month');


                                  }
                                ),
                              ),
                              AdaptivePositioned(
                                left: 199,
                                top: 44,
                                child: GeneralTextDisplay(
                                    'Average',
                                    Color.fromRGBO(51, 51, 51, 1.0),
                                    1,
                                    12,
                                    FontWeight.w400,
                                    'average'),
                              ),
                              AdaptivePositioned(
                                left: 252,
                                top: 44,
                                child: GeneralTextDisplay(
                                    '${model.calculateAverage()}',
                                    Color.fromRGBO(51, 51, 51, 1.0),
                                    1,
                                    12,
                                    FontWeight.bold,
                                    'average value'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    model.patientData==null?Container():AdaptivePositioned(
                      left: 24,
                      top: 347,
                      child: AdaptiveSizedBox(
                        height: (350 / 667),
                        width: (326 / 375),
                        child: Material(
                          elevation: 1.0,
                          /*shadowColor: Color.fromRGBO(242, 242, 242, 1.0),*/
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(height * (20 / 667))),
                          child: Stack(
                            children: <Widget>[
                              AdaptivePositioned(
                                left: 25,
                                top: 22,
                                child: GeneralTextDisplay(
                                    'Patient History',
                                    Color.fromRGBO(51, 51, 51, 1.0),
                                    1,
                                    14,
                                    FontWeight.w400,
                                    'weight'),
                              ),
                              Positioned(
                                  left: width * (25 / 375),
                                  top: height * (57 / 667),
                                  right: width * (25 / 375),
                                  bottom: height * (0 / 667),
                                  child: AdaptiveSizedBox(
                                      height: 189 / 667,
                                      child: ListView.builder(
                                          key: Key(randomString(8)),
                                          physics:
                                              BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Container(
                                              height: height * (135 / 667),
                                              width: width * (278 / 375),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    height: height * (47 / 667),
                                                    width: width * (278 / 375),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(248, 249, 251, 1.0),
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(height * (11 / 667)),
                                                            topLeft: Radius.circular(height * (11 / 667)))),
                                                    child: ListView.builder(
                                                        itemCount: model.dataEntryKey.length,
                                                        itemBuilder: (context, snapshot) {
                                                          return Stack(
                                                            children: <Widget>[
                                                              AdaptivePositioned(
                                                                left: 15,
                                                                top: 15,
                                                                child: GeneralTextDisplay(
                                                                    model.dataEntryKey[index]+1.toString().endsWith('1')==true?
                                                                    '${ model.dataEntryKey[index]+1}st record':
                                                                    model.dataEntryKey[index]+1.toString().endsWith('2')==true?
                                                                        '${ model.dataEntryKey[index]+1}nd record':
                                                                    model.dataEntryKey[index]+1.toString().endsWith('3')==true?
                                                                    '${ model.dataEntryKey[index]+1}rd record':
                                                                    '${ model.dataEntryKey[index]+1}th record',
                                                                    Color.fromRGBO(51, 51, 51, 1.0),
                                                                    1,
                                                                    15,
                                                                    FontWeight.w600,
                                                                    'records'),
                                                              ),
                                                              AdaptivePositioned(
                                                                left: 120,
                                                                top: 19,
                                                                child: GeneralTextDisplay(
                                                                    model.dataEntryKey[index],
                                                                    Color.fromRGBO(51, 51, 51, 1.0),
                                                                    1,
                                                                    11,
                                                                    FontWeight.w400,
                                                                    'full date'),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                    ),
                                                  ),
                                                  Container(
                                                    height: height * (44 / 667)*model.dataEntryValue.length,
                                                    width: width * (278 / 375),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(239, 238, 252, 1.0),
                                                        borderRadius: BorderRadius.only(
                                                            bottomRight: Radius.circular(height * (11 / 667)),
                                                            bottomLeft: Radius.circular(height * (11 / 667)))),
                                                    child: Stack(
                                                      children: <Widget>[
                                                        AdaptivePositioned(
                                                          left: 17,
                                                          top: 18,
                                                          child: ListView.builder(
                                                          itemCount:model.dataEntryValue.length ,
                                                            itemBuilder: (context, snapshot) {
                                                              return Column(
                                                                children: <Widget>[
                                                                  Row(
                                                                    children: <Widget>[
                                                                      GeneralTextDisplay(
                                                                          model.dataEntryValue[index].keys,
                                                                          Color.fromRGBO(113, 106, 187, 1.0),
                                                                          1,
                                                                          15,
                                                                          FontWeight.w600,
                                                                          'entryKey'),
                                                                      SizedBox(width:width*(99/375)),
                                                                      GeneralTextDisplay(
                                                                          model.dataEntryValue[index].values,
                                                                          Colors.black,
                                                                          1,
                                                                          17,
                                                                          FontWeight.w600,
                                                                          'entryValue'),
                                                                    ],
                                                                  ),
                                                                  SizedBox(width:width*(12/667)),
                                                                ],
                                                              );
                                                            }
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )));
  }
}
