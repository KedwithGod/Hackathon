import 'package:flutter/material.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextfielddisplay.dart';

import 'moreSignUP.dart';

class NormalSignUp extends StatelessWidget {
  final name =TextEditingController();
  final phoneNumber=TextEditingController();
  final password=TextEditingController();
  final GlobalKey _formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(child:Scaffold(
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
            top: 240,
            child: Form(
              key:_formKey,
              child: Column(
                children: <Widget>[
                  GeneralTextField(
                      '',
                      TextInputType.text,
                     name,
                      'Enter Name',
                      'Chinedu Adebayo hussen',
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
                      phoneNumber,
                      'Phone Number',
                      '090867486422',
                      'workPhone',
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
                      'jaheihe04854298572kj#%@%%',
                      'name',
                      1,
                      Icons.remove_red_eye,
                      true,
                      55,
                      315),




                ],
              ),
            ),
          ),
          AdaptivePositioned(
            left: 24,
            top: 494,
            child: GeneralButton(
                '',
                1,
                'register',
                'Register',
                Colors.white,
                18,
                FontWeight.w600,
                55,
                334,
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          MoreSignUp()));
                    },
                11,
                11,
                11,
                11,
                Color.fromRGBO(18, 77, 157, 1.0),
                Colors.white,
                2.0),
          )
        ],
      ) ,
    ));
  }
}
