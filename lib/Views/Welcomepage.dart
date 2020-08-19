import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/Model/Bloc_settings.dart';
import 'package:hackthon/ViewModels/BaseModel.dart';
import 'package:hackthon/ViewModels/blocViewModel.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/sizedBox.dart';

import 'package:provider_architecture/provider_architecture.dart';

class WelcomePage extends StatelessWidget {
  final langDialog=false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ViewModelProvider<BaseModel>.withConsumer(
        onModelReady: (model) {
          model.networkConnection();
          model.setUserId();
          print(model.userId);
        },
        viewModelBuilder: () => BaseModel(),
        disposeViewModel: false,
        builder: (context, model, child) => WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: model.netStat == false
                ? StatesBuilder(
              stateID: 'langChange',
              blocs: [mainBloc],
              builder: (_){
               /* var value;
                mainBloc.langChange=='english'?
                    value=english:
                    mainBloc.langChange=='yoruba'?
                    value=yoruba: mainBloc.langChange=='hausa'?
                    value=hausa: mainBloc.langChange=='igbo'?
                    value=igbo:null;*/
                return SafeArea(
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
                    );}
                )
                : StatesBuilder(
                stateID: 'langDialog',
                blocs: [mainBloc],
                builder: (_){
                 /* var value;
                  mainBloc.langChange=='english'?
                  value=english:
                  mainBloc.langChange=='yoruba'?
                  value=yoruba: mainBloc.langChange=='hausa'?
                  value=hausa: mainBloc.langChange=='igbo'?
                  value=igbo:null;*/
                  return SafeArea(
                    child: Scaffold(
              backgroundColor: Colors.white,
              body:SafeArea(
                    child:Stack(
                      children: <Widget>[
                        AdaptivePositioned(
                          left: 22,
                        top: 29,
                        child: GeneralTextDisplay(
                            'Welcome',
                                  Colors.black,
                                  1,
                                  30,
                                  FontWeight.bold,
                                  'Welcome page'),
                            ),
                        AdaptivePositioned(
                          left: 22,
                          top: 81,
                          child: GeneralTextDisplay(
                              'Sign in as',
                              Colors.black,
                              1,
                              20,
                              FontWeight.w600,
                              'sign in as'),
                        ),

                        AdaptivePositioned(
                          left:198 ,
                          top: 202,
                          child: GeneralButton(
                                 '',
                                  2,
                                  'Health worker',
                              'Health care worker',
                                  Colors.white,
                                  20,
                                 FontWeight.w600,
                                 66,
                                  150,
                              (){},
                                  0,
                                  0,
                                  0,
                                  0,
                                  Color.fromRGBO(77, 45, 164, 1.0),
                                  Colors.white,
                                  5.0),
                            ),

                        AdaptivePositioned(
                          left:198 ,
                          top: 377,
                          child: GeneralButton(
                              '',
                              1,
                              'Mother',
                              'mother',
                              Colors.white,
                              20,
                              FontWeight.w600,
                              40,
                              150,
                                  (){},
                              0,
                              0,
                              0,
                              0,
                              Color.fromRGBO(77, 45, 164, 1.0),
                              Colors.white,
                              5.0),
                        ),
                        StatesBuilder(
                            stateID: 'langDialog',
                            blocs: [mainBloc],
                            builder: (_){
                              return AdaptivePositioned(
                            left: 318,
                            top: 33,
                            child:
                            Icon(FontAwesomeIcons.globe,size: 40,color:Color.fromRGBO(77, 45,164, 1.0)),

                              );}
                        ),

               langDialog==true?
                AdaptivePositioned(
                    left: 185,
                    top: 19,
                    child: Container(
                      width: width*(177/375),
                      height: height*(169/667),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color:Colors.black, width:1.0
                        )
                      ),
                      child: Stack(
                        children: <Widget>[
                          AdaptivePositioned(
                            left:24 ,
                            top: 10,
                            child: GeneralTextDisplay(
                                                      'Select language',
                                                      Colors.black,
                                                      1,
                                                      18,
                                                      FontWeight.w400,
                                                     'select Language'),
                                                ),
                          AdaptivePositioned(
                            left:24 ,
                            top: 49,
                            child: GestureDetector(
                              onTap: (){
                                mainBloc.updateLang('english');
                                mainBloc.changeLangDialog(false);
                              },
                              child: GeneralTextDisplay(
                                  'English',
                                  mainBloc.langChange=='english'?
                                   Color.fromRGBO(77, 45, 164, 1.0):
                                  Colors.black,
                                  1,
                                  15,
                                  mainBloc.langChange=='english'?FontWeight.bold:FontWeight.w400,
                                  'select Language'),
                            ),
                          ),
                          AdaptivePositioned(
                            left:24 ,
                            top: 77,
                            child: GestureDetector(
                              onTap: (){
                                mainBloc.updateLang('hausa');
                                mainBloc.changeLangDialog(false);
                              },
                              child: GeneralTextDisplay(
                                  'Hausa',
                                  mainBloc.langChange=='hausa'?
                                  Color.fromRGBO(77, 45, 164, 1.0):
                                  Colors.black,
                                  1,
                                  15,
                                  mainBloc.langChange=='hausa'?FontWeight.bold:FontWeight.w400,
                                  'select Language'),
                            ),
                          ),
                          AdaptivePositioned(
                            left:24 ,
                            top: 105,
                            child: GestureDetector(
                              onTap: (){
                                mainBloc.updateLang('igbo');
                                mainBloc.changeLangDialog(false);
                              },
                              child: GeneralTextDisplay(
                                  'Igbo',
                                  mainBloc.langChange=='igbo'?
                                  Color.fromRGBO(77, 45, 164, 1.0):
                                  Colors.black,
                                  1,
                                  15,
                                  mainBloc.langChange=='igbo'?
                                  FontWeight.bold:FontWeight.w400,
                                  'select Language'),
                            ),
                          ),
                          AdaptivePositioned(
                            left:24 ,
                            top: 133,
                            child: GestureDetector(
                              onTap: (){
                                mainBloc.updateLang('yoruba');
                                mainBloc.changeLangDialog(false);
                              },
                              child: GeneralTextDisplay(
                                  'Yoruba',
                                  mainBloc.langChange=='yoruba'?
                                  Color.fromRGBO(77, 45, 164, 1.0):
                                  Colors.black,
                                  1,
                                  15,
                                  mainBloc.langChange=='yoruba'?
                                  FontWeight.bold:FontWeight.w400,
                                  'select Language'),
                            ),
                          ),
                        ],
                      )
                    ),
                )
                :
                Container()

                ],
                    )
              )

            ),
                  );}
                )));
  }
}

Map english= {
  'first':'Welcome',
  'second':'Sign in as',
  'third':'Health care worker',
  'forth': 'mother',
  'five':'Kindly switch on your data'
};Map yoruba= {
  'first':'Kaabo',
  'second':'Wole gege bi',
  'third':'Osise itoju ilera',
  'forth': 'Iya',
  'five':'Jowo tan data re'
};Map igbo= {
  'first':'Nnabata',
  'second':'Banye di ka',
  'third':'Ndi oru ahuike ',
  'forth': 'nne/iyaa',
  'five':'Jiri nwayọ gbanye data gị'
};Map hausa= {
  'first':'Barka da zuwa',
  'second':'Shiga azaman',
  'third':'Ma\'aikatan kula da lafiya',
  'forth': 'uwa',
  'five':'Da kyau canza bayanai'
};