import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/ViewModels/addCardViewModel.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class GrowthMeasurement extends StatelessWidget {
  final String userName;
  final dynamic imageFile;

  GrowthMeasurement(this.userName, this.imageFile);

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
                        backgroundColor: Colors.white,
                        body: Stack(
                          children: <Widget>[
                            AdaptivePositioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                height: height * (82 / 667),
                                width: width,
                                color: Color.fromRGBO(20, 78, 162, 1.0),
                              ),
                            ),
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
                                  'Patrick ivon',
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
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/mother.jpg'),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle)),
                            ),
                            AdaptivePositioned(
                              left: 0,
                              top: 82,
                              child: Container(
                                height: height * (187 / 667),
                                width: width,
                                color: Color.fromRGBO(10, 66, 149, 1.0),
                              ),
                            ),
                            AdaptivePositioned(
                              left: 24,
                              top: 107,
                              child: GeneralTextDisplay(
                                  'Gender:',
                                  Color.fromRGBO(215, 215, 215, 1.0),
                                  1,
                                  17,
                                  FontWeight.w600,
                                  'patient name'),
                            ),
                            AdaptivePositioned(
                              left: 95,
                              top: 107,
                              child: GeneralTextDisplay(
                                  model.patientData['gender'],
                                  Colors.white,
                                  1,
                                  17,
                                  FontWeight.w600,
                                  'gender'),
                            ),
                            AdaptivePositioned(
                              left: 24,
                              top: 137,
                              child: GeneralTextDisplay(
                                  'Age:',
                                  Color.fromRGBO(215, 215, 215, 1.0),
                                  1,
                                  17,
                                  FontWeight.w600,
                                  'patient name'),
                            ),
                            AdaptivePositioned(
                              left: 61,
                              top: 137,
                              child: GeneralTextDisplay(
                                  '${model.getAge()['Years']} ${model.getAge()['Years'] == 1 ? 'year' : 'years'}, ${model.getAge()['Months']} ${model.getAge()['Months'] == 1 ? 'month' : 'months'}, ${model.getAge()['Days']}${model.getAge()['Days'] == 1 ? 'day' : 'days'},',
                                  Colors.white,
                                  1,
                                  17,
                                  FontWeight.w600,
                                  'age'),
                            ),
                            AdaptivePositioned(
                              left: 0,
                              top: 187,
                              child: Container(
                                height: height * (480 / 667),
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            height * (80 / 667)))),
                              ),
                            ),
                            AdaptivePositioned(
                                left: 32,
                                top: 240,
                                child: Container(
                                  height: height * (54 / 667),
                                  width: width * (298 / 375),
                                  alignment: Alignment.center,
                                  child: GeneralTextDisplay(
                                      'Normal growth value',
                                      Color.fromRGBO(0, 0, 191, 1.0),
                                      1,
                                      20,
                                      FontWeight.bold,
                                      'normal growth'),
                                )),
                            AdaptivePositioned(
                                left: 32,
                                top: 314,
                                child: Container(
                                  height: height * (141 / 667),
                                  width: width * (146 / 375),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(244, 247, 255, 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              height * (30 / 667)))),
                                  child: Stack(
                                    children: <Widget>[
                                      AdaptivePositioned(
                                        left: 25,
                                        top: 26,
                                        child: GeneralTextDisplay(
                                            'Weight range',
                                            Color.fromRGBO(51, 51, 51, 1.0),
                                            1,
                                            14,
                                            FontWeight.w400,
                                            'weight'),
                                      ),
                                      AdaptivePositioned(
                                        left: 34,
                                        top: 73,
                                        child: GeneralTextDisplay(
                                            '30-40 kg',
                                            Color.fromRGBO(51, 51, 51, 1.0),
                                            1,
                                            17,
                                            FontWeight.bold,
                                            'weight'),
                                      ),
                                    ],
                                  ),
                                )),
                            AdaptivePositioned(
                                left: 189,
                                top: 314,
                                child: Container(
                                  height: height * (141 / 667),
                                  width: width * (146 / 375),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(244, 247, 255, 1.0),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              height * (30 / 667)))),
                                  child: Stack(
                                    children: <Widget>[
                                      AdaptivePositioned(
                                        left: 25,
                                        top: 26,
                                        child: GeneralTextDisplay(
                                            'Height range',
                                            Color.fromRGBO(51, 51, 51, 1.0),
                                            1,
                                            14,
                                            FontWeight.w400,
                                            'weight'),
                                      ),
                                      AdaptivePositioned(
                                        left: 34,
                                        top: 73,
                                        child: GeneralTextDisplay(
                                            '30-40 cm',
                                            Color.fromRGBO(51, 51, 51, 1.0),
                                            1,
                                            17,
                                            FontWeight.bold,
                                            'weight'),
                                      ),
                                    ],
                                  ),
                                )),
                            AdaptivePositioned(
                              left: 111,
                              top: 494,
                              child: GeneralButton(
                                  '',
                                  1,
                                  'graph',
                                  'View Graph',
                                  Colors.white,
                                  14,
                                  FontWeight.w600,
                                  40,
                                  140,
                                  () {},
                                  11,
                                  11,
                                  11,
                                  11,
                                  Color.fromRGBO(18, 77, 157, 1.0),
                                  Colors.white,
                                  2.0),
                            )
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
