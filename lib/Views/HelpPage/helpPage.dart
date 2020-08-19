import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/ViewModels/BaseModel.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextfielddisplay.dart';
import 'package:hackthon/Views/uielement/sizedBox.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:random_string/random_string.dart';

class HelpPage extends StatelessWidget {
  final locationChange = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    _listContainer() {
      return AdaptiveSizedBox(
        height: height * (67 / 667),
        width: width * (343 / 375),
        child: Material(
          elevation: 3.0,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.35),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(height * (11 / 667))),
          child: Stack(
            children: <Widget>[
              AdaptivePositioned(
                  left: 15,
                  top: 18,
                  child: Icon(MdiIcons.car,
                      size: height * (36 / 667),
                      color: Color.fromRGBO(0, 0, 191, 1.0))),
              AdaptivePositioned(
                left: 86,
                top: 22,
                child: GeneralTextDisplay('Fapete ambulance', Colors.white, 1,
                    20, FontWeight.w400, 'name'),
              ),
              AdaptivePositioned(
                  left: 15,
                  top: 18,
                  child: Icon(MdiIcons.phone,
                      size: height * (20 / 667),
                      color: Color.fromRGBO(51, 51, 51, 1.0))),
            ],
          ),
        ),
      );
    }

    _changeLocation() {
      return AdaptivePositioned(
        left: 24,
        top: 123,
        child: AdaptiveSizedBox(
          height: height * (239 / 667),
          width: width * (334 / 375),
          child: Material(
            elevation: 10.0,
            shadowColor: Color.fromRGBO(242, 242, 242, 1.0),
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(height * (28 / 667))),
            child: Stack(
              children: <Widget>[
                AdaptivePositioned(
                  left: 25,
                  top: 20,
                  child: GeneralTextDisplay(
                      'Change location',
                      Color.fromRGBO(0, 0, 191, 1.0),
                      1,
                      20,
                      FontWeight.w600,
                      'change location'),
                ),
                AdaptivePositioned(
                    left: 283,
                    top: 20,
                    child: Icon(MdiIcons.close,
                        size: height * (20 / 667),
                        color: Color.fromRGBO(215, 215, 215, 1.0))),
                AdaptivePositioned(
                  left: 25,
                  top: 54,
                  child: Container(
                    height: height * (36 / 667),
                    width: width * (278 / 375),
                    child: GeneralTextDisplay(
                        'If the location display is not your current location, change it here.',
                        Color.fromRGBO(18, 77, 157, 1.0),
                        3,
                        15,
                        FontWeight.w600,
                        'today'),
                  ),
                ),
                AdaptivePositioned(
                  left: 25,
                  top: 110,
                  child: GeneralTextField(
                      '',
                      TextInputType.text,
                      locationChange,
                      'Current location',
                      'Enter current location',
                      'name',
                      1,
                      Icons.search,
                      false,
                      290,
                      42),
                ),
                AdaptivePositioned(
                  left: 94,
                  top: 172,
                  child: GeneralButton(
                      '',
                      1,
                      'Save',
                      'Save',
                      Colors.white,
                      17,
                      FontWeight.w400,
                      39,
                      140,
                      () {},
                      11,
                      11,
                      11,
                      11,
                      Color.fromRGBO(18, 77, 157, 1.0),
                      Colors.white,
                      2.0),
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
          model.getCurrentLocation();
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
                          height: height * (192 / 667),
                          width: width,
                          color: Color.fromRGBO(20, 78, 162, 1.0),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 138,
                        top: 38,
                        child: GeneralTextDisplay(
                            'Help Page',
                            Colors.white,
                            1,
                            20,
                            FontWeight.bold,
                            'help page'),
                      ),
                      AdaptivePositioned(
                        left: 20,
                        top: 40,
                        child: Container(
                          height: height * (44 / 667),
                          width: width * (335 / 375),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(34, 99, 191, 1.0),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(height * (30 / 667)))),
                          child: Stack(
                            children: <Widget>[
                              AdaptivePositioned(
                                left: 25,
                                top: 13,
                                child: GeneralTextDisplay(
                                    'Search',
                                    Color.fromRGBO(242, 242, 242, 1.0),
                                    1,
                                    16,
                                    FontWeight.w400,
                                    'search text'),
                              ),
                              AdaptivePositioned(
                                  left: 288,
                                  top: 12,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Icon(FontAwesomeIcons.search,
                                        size: height * (20 / 667),
                                        color: Color.fromRGBO(
                                            242, 242, 242, 1.0)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 35,
                        top: 139,
                        child: Container(
                          height: height * (46 / 667),
                          width: width * (150/ 375),
                          alignment: Alignment.topLeft,
                          child: GeneralTextDisplay(model.currentAddress??'No location', Colors.white,
                              2, 15, FontWeight.bold, 'location'),
                        ),
                      ),
                      AdaptivePositioned(
                          left: 10,
                          top: 136,
                          child: Icon(Icons.location_on,
                              size: height * (20 / 667),
                              color: Color.fromRGBO(242, 242, 242, 1.0))),
                      AdaptivePositioned(
                        left: 230,
                        top: 139,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return _changeLocation();
                                });
                          },
                          child: GeneralTextDisplay(
                              'Change Location',
                              Colors.white,
                              1,
                              15,
                              FontWeight.bold,
                              'location'),
                        ),
                      ),
                      AdaptivePositioned(
                          left: 205,
                          top: 136,
                          child: Icon(MdiIcons.filter,
                              size: height * (20 / 667),
                              color: Color.fromRGBO(242, 242, 242, 1.0))),
                      Positioned(
                          left: width * (16 / 375),
                          top: height * (232 / 667),
                          right: width * (16 / 375),
                          bottom: height * (20 / 667),
                          child: AdaptiveSizedBox(
                              height: 189 / 667,
                              child: ListView(
                                  key: Key(randomString(8)),
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    _listContainer(),
                                    AdaptiveSizedBox(
                                      height: height * (15 / 667),
                                    )
                                  ])))
                    ],
                  ),
                ),
              ));
  }
}
