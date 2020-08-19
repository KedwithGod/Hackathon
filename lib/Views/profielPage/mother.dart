import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackthon/Views/HelpPage/helpPage.dart';
import 'package:hackthon/Views/profielPage/normalSignUp.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';

class Mother extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                left:74,
                top:134,
                child: GeneralTextDisplay(
                    'Welcome OnBoard!',Color.fromRGBO(18, 77, 157, 1.0), 1, 24,
                    FontWeight.w500, 'welcome')
            ),
            AdaptivePositioned(
              left:20,
              top:210,
              child: SizedBox(
                  width: width*(158/375),
                  height: height*(225/667),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          Mother()));
                    },
                    child: Material(
                      elevation: 5.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.asset('assets/nursingMother.jpg'),
                    ),
                  )),
            ),
            AdaptivePositioned(
              left:187,
              top:210,
              child: SizedBox(
                width: width*(158/375),
                height: height*(225/667),
                child: Material(
                  elevation: 5.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image.asset('assets/pregnantWoman.png'),
                ),
              ),

            ),

            AdaptivePositioned(
                left:51,
                top:480,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        Mother()));
                  },
                  child: Container(
                    height: height * (60 / 667),
                    width: width * (150/ 375),
                    alignment: Alignment.topLeft,
                    child: GeneralTextDisplay(
                        'Nursing mother',Colors.black, 2, 20,
                        FontWeight.w500, 'welcome'),
                  ),
                )
            ),

            AdaptivePositioned(
                left:220,
                top:480,
                child: Container(
                  height: height * (60 / 667),
                  width: width * (150/ 375),
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          NormalSignUp()));
                    },
                    child: GeneralTextDisplay(
                        'Pregnant Woman',Colors.black, 2, 20,
                        FontWeight.w500, 'welcome'),
                  ),
                )
            ),

            AdaptivePositioned(
                left:0,
                top:590,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        HelpPage()));
                  },
                  child: Container(
                    width: width ,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: height * (30 / 667),
                          width: height * (30 / 667),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,color: Colors.red
                          ),
                          child: Icon(Icons.phone,size:height * (20 / 667) ,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: width * (10 / 375),
                        ),
                        GeneralTextDisplay('Emergency call',
                            Colors.black,
                            1,
                            17, FontWeight.w600, 'emergency'),

                      ],
                    ),
                  ),
                )),
            AdaptivePositioned(
              left: 318,
              top: 33,
              child:
              Icon(FontAwesomeIcons.globe,size: 40,color:Color.fromRGBO(77, 45,164, 1.0)),

            )
          ],
        ),
      ),
    );
  }
}
