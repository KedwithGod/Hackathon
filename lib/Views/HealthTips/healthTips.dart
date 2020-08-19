import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:random_string/random_string.dart';

class HealthTipHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(child:
    Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
       children: <Widget>[
         AdaptivePositioned(
           left: 0,
           top: 0,
           child: Container(
             height:height ,
             width: width,
             color: Color.fromRGBO(20, 78, 162, 1.0),
           ),
         ),

         AdaptivePositioned(
           left: 20,
           top: 20,
           child: IconButton(icon: Icon(Icons.menu,
             size:height*(25/667),color: Colors.white,),
               onPressed:(){}),
         ),
         AdaptivePositioned(
           left: 90,
           top: 29,
           child: GeneralTextDisplay('Pregnancy Health tips', Colors.white, 1,
               20, FontWeight.w600, 'patient name'),
         ),

         AdaptivePositioned(
           left:35,
           top:75,
           child: GeneralTextDisplay(
               'Trimester Journey',
               Color.fromRGBO(200, 200, 200, 1.0),
               2, 16,
               FontWeight.w400, 'trimester'),
         ),
         Positioned(
             left: width * (20 / 375),
             top: height * (110 / 667),
             right: width * (20 / 375),
            
             child: SizedBox(
                 height: height * (270 / 667),
                 child: ListView(
                     key: Key(randomString(8)),
                     physics: BouncingScrollPhysics(),
                     scrollDirection: Axis.horizontal,
                     shrinkWrap: true,
                     children: <Widget>[
                       Column(
                         children: <Widget>[
                           SizedBox(
                             width: width*(183/375),
                             height: height*(225/667),
                             child: Material(
                               elevation: 0.0,
                               color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(30)),
                               child:
                                   Image.asset('assets/firstTrimester.png'),

                               ),

                           ),
                           SizedBox(
                             height: height*(10/375),
                           ),
                            GeneralTextDisplay('First Trimester', Colors.white,
                                1, 15, FontWeight.w400, 'trimester label'),
                          ],
                       ),
                       SizedBox(
                         width: width*(20/375),
                       ),
                       Column(
                         children: <Widget>[
                           SizedBox(
                             width: width*(183/375),
                             height: height*(225/667),
                             child: Material(
                               elevation: 0.0,
                               color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(30)),
                               child:
                                   Image.asset('assets/secondTrimester.png'),

                             ),
                           ),
                           SizedBox(
                             height: height*(10/375),
                           ),
                           AdaptivePositioned(
                             left: 12,
                             top: 206,
                             child: GeneralTextDisplay('Second Trimester',
                                 Colors.white, 1,
                                 15, FontWeight.w400, 'trimester label'),

                           ),
                         ],
                       ),
                       SizedBox(
                         width: width*(20/375),
                       ),
                       Column(
                         children: <Widget>[
                           SizedBox(
                             width: width*(183/375),
                             height: height*(225/667),
                             child: Material(
                               elevation: 0.0,
                               color: Colors.white,
                               borderRadius: BorderRadius.all(Radius.circular(30)),
                               child:
                                   Image.asset('assets/ThirTrimester.png'),

                             ),
                           ),
                           SizedBox(
                             height: height*(10/375),
                           ),
                           GeneralTextDisplay('Third Trimester',
                               Colors.white, 1,
                               15, FontWeight.w400, 'trimester label'),
                         ],
                       ),

                     ]))),

         AdaptivePositioned(
           left:35,
           top:400,
           child: GeneralTextDisplay(
               'Nutrition',
               Color.fromRGBO(200, 200, 200, 1.0),
               2, 17,
               FontWeight.w600, 'trimester'),
         ),

         AdaptivePositioned(
           left:20,
           top:450,
           child: SizedBox(
               width: width*(158/375),
               height: height*(180/667),
               child: GestureDetector(
                 onTap: (){

                 },
                 child: Material(
                   elevation: 5.0,
                   color: Colors.white,
                   borderRadius: BorderRadius.all(Radius.circular(30)),
                   child: Column(
                     children: <Widget>[
                       Image.asset('assets/PregnantEating.jpg'),
                       Row(

                         children: <Widget>[
                           SizedBox(
                             width: width*(20/375),
                           ),
                           Container(
                             width: width*(135/375),
                             height: height*(33/667),
                             alignment: Alignment.center,
                             child: GeneralTextDisplay(
                                 'Nutrition During Pregnancy',
                                 Colors.black,
                                 2, 14,
                                 FontWeight.w500, 'trimester'),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
               )),
         ),
         AdaptivePositioned(
           left:197,
           top:450,
           child: SizedBox(
             width: width*(158/375),
             height: height*(180/667),
             child: Material(
               elevation: 5.0,
               color: Colors.white,
               borderRadius: BorderRadius.all(Radius.circular(30)),
               child: Column(
                 children: <Widget>[
                   Image.asset('assets/breastFeeding.jpeg'),
                       Row(

                         children: <Widget>[
                           SizedBox(
                             width: width*(20/375),
                           ),
                           Container(
                             width: width*(135/375),
                             height: height*(33/667),
                             alignment: Alignment.center,
                             child: GeneralTextDisplay(
                                 'Nutrition During BreastFeeding',
                                 Colors.black,
                                 2, 14,
                                 FontWeight.w500, 'trimester'),
                           ),
                         ],
                       )

                 ],
               ),
             ),
           )),

       ],
      ),
    ));
  }
}
