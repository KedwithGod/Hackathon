import 'package:flutter/material.dart';
import 'package:hackthon/Views/HealthTips/healthTips.dart';
import 'package:hackthon/Views/HelpPage/helpPage.dart';
import 'package:hackthon/Views/profielPage/pregnancyRequirement.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextfielddisplay.dart';

class LoginPage extends StatelessWidget {
  final username =TextEditingController();
  final password=TextEditingController();
  final GlobalKey _formKey=GlobalKey();
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
              top:160,
              child: Container(
                height: height * (60 / 667),
                width: width*(333/375) ,
                alignment: Alignment.center,
                child: GeneralTextDisplay(
                    'Welcome back!',
                    Color.fromRGBO(18, 77, 157, 1.0), 2, 20,
                    FontWeight.w500, 'welcome'),
              )
          ),

          AdaptivePositioned(
            left:20,
            top: 245,
            child: Form(
              key:_formKey,
              child: Column(
                children: <Widget>[
                  GeneralTextField(
                      '',
                      TextInputType.text,
                      username,
                      'Username',
                      'Enter Registered Name',
                      'name',
                      1,
                      Icons.search,
                      false,
                      55,
                      315),
                  SizedBox(
                    height: height*(15/667),

                  ), GeneralTextField(
                      '',
                      TextInputType.text,
                      password,
                      'Password',
                      'lkghaoe80940749#454i',
                      'name',
                      1,
                      Icons.search,
                      false,
                      55,
                      315),
                  SizedBox(
                    height: height*(15/667),

                  ),



                ],
              ),
            ),
          ),
          AdaptivePositioned(
            left: 24,
            top: 400,
            child:SizedBox(
              height:  height*(50/667),
              width: width*(322/375),
              child: Material(
                elevation: 5.0,
                color: Color.fromRGBO(18, 77, 157, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(height*(11/667))
                  ),
                ),
                  child: Stack(
                    children: <Widget>[
                      AdaptivePositioned(
                        left: 130,
                        top: 15,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                HealthTipHome()));
                          },
                          child: GeneralTextDisplay(
                          'LOG IN',
                          Colors.white,
                          1,
                          18,
                          FontWeight.w600,
                          'login'),
                        ),
                      ),
                SizedBox(width:width*(60/375)),
                AdaptivePositioned(
                  left: 275,
                  top: 15,
                  child: Icon(Icons.fingerprint,size: height*(25/667),
                  color: Colors.white,),
                ),
                    ],
                  ),

              ),
            ),
          ),

          AdaptivePositioned(left: 35,
          top: 470,
          child: Row(
            children: <Widget>[
                GestureDetector(
                  onTap:(){},
                  child: GeneralTextDisplay('Forgot password',
                      Color.fromRGBO(51, 51, 51, 1.0), 1,
                    14 , FontWeight.w500, 'password'),
                ),
              SizedBox(
                width: width*(16/375) ,
              ),
              Container(
                color: Color.fromRGBO(21, 18, 89, 0.5),
                height: height * (25 / 667),
                width: width*(2/375) ,
              ),
              SizedBox(
                width: width*(20/375) ,
              ),
              GestureDetector(
                onTap:(){},
                child: GeneralTextDisplay('Create account', Colors.black, 1,
                    16 , FontWeight.w600, 'password'),
              ),
              ],
          ),),


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
                        width: width * (15 / 375),
                      ),
                      GeneralTextDisplay('Emergency call',
                          Colors.black,
                          1,
                          16, FontWeight.w600, 'emergency'),

                    ],
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
