import 'package:flutter/material.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
class FirstTrimesterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          AdaptivePositioned(
            left: 20,
            top:20,
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back,
                color: Color.fromRGBO(0, 0, 191, 1.0),
                size:height*(20/667),
              ),

            ),


          ),
          AdaptivePositioned(
              left:20,
              top:35,
              child: Container(
                height: height * (60 / 667),
                width: width*(333/375) ,
                alignment: Alignment.center,
                child: GeneralTextDisplay(
                    'First Trimester',
                    Color.fromRGBO(18, 77, 157, 1.0), 2, 24,
                    FontWeight.w500, 'welcome'),
              )
          ),

          AdaptivePositioned(
            left:10,
            top:45,
            child: SizedBox(
                width: width*(169/375),
                height: height*(278/667),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Material(
                    elevation: 5.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Stack(
                      children: <Widget>[
                        AdaptivePositioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                              width: width*(169/375),
                              height: height*(139/667),
                              child: Image.asset('assets/fourWeeks.jpeg')),
                        ),

                        AdaptivePositioned(
                          left:16,
                          top: 21,
                          child: GeneralTextDisplay(
                              'What To Expect',
                              Colors.black,
                              1, 16,
                              FontWeight.w500, 'what to expect'),
                        ),
                        AdaptivePositioned(
                          left:16,
                          top: 29,
                          child: Container(
                            width: width*(169/375),
                            height: height*(139/667),
                            child: GeneralTextDisplay(
                                'The first trimester of pregnancy is marked by an invisible — yet... ',
                                Colors.black,
                                5, 14,
                                FontWeight.w400, 'notes on what to expect'),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
          AdaptivePositioned(
            left:200,
            top:45,
            child: SizedBox(
                width: width*(169/375),
                height: height*(278/667),
                child: GestureDetector(
                  onTap: (){

                  },
                  child: Material(
                    elevation: 5.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Stack(
                      children: <Widget>[
                        AdaptivePositioned(
                          left: 0,
                          top: 0,
                          child: SizedBox(
                              width: width*(169/375),
                              height: height*(139/667),
                              child: Image.asset('assets/pregnantThinking.jpeg')),
                        ),

                        AdaptivePositioned(
                          left:16,
                          top: 21,
                          child: GeneralTextDisplay(
                              'Hormonal Changes',
                              Colors.black,
                              1, 16,
                              FontWeight.w500, 'Hormonal Changes'),
                        ),
                        AdaptivePositioned(
                          left:16,
                          top: 29,
                          child: Container(
                            width: width*(169/375),
                            height: height*(139/667),
                            child: GeneralTextDisplay(
                                'From the moment you become pregnant until weeks after birth, your hor..',
                                Colors.black,
                                5, 14,
                                FontWeight.w400, 'notes on hormonal change'),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),


        ],
      ),
    ));
  }
}
