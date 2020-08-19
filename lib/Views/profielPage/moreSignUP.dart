import 'package:flutter/material.dart';
import 'package:hackthon/Views/profielPage/pregnancyRequirement.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextfielddisplay.dart';

class MoreSignUp extends StatelessWidget {
  final dob =TextEditingController();
  final weight=TextEditingController();
  final heightEntry=TextEditingController();
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
              top:134,
              child: Container(
                height: height * (60 / 667),
                width: width*(333/375) ,
                alignment: Alignment.center,
                child: GeneralTextDisplay(
                    'We\'ll like to know a few things\n               about you',
                    Color.fromRGBO(18, 77, 157, 1.0), 2, 20,
                    FontWeight.w500, 'welcome'),
              )
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
                      dob,
                      'Date of Birth',
                      '1990/12/29: YYYY/MM/DD',
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
                      weight,
                      'Weight',
                      '50 kg (optional)',
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
                      heightEntry,
                      'Height',
                      '30 cm (optional)',
                      'name',
                      1,
                      Icons.remove_red_eye,
                      false,
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
                'next',
                'Next',
                Colors.white,
                18,
                FontWeight.w600,
                55,
                334,
                    () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      PregnantWomanRequirement()));
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
      ),
    ));
  }
}
