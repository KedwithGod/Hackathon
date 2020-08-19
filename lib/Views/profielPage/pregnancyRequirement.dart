import 'package:flutter/material.dart';
import 'package:hackthon/Views/profielPage/loginPage.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextfielddisplay.dart';

class PregnantWomanRequirement extends StatefulWidget {
  @override
  _PregnantWomanRequirementState createState() => _PregnantWomanRequirementState();
}

class _PregnantWomanRequirementState extends State<PregnantWomanRequirement> {
  final pregnancyLength =TextEditingController();

  final medicalCondition=TextEditingController();

  final GlobalKey _formKey=GlobalKey();

   List<String> _dropdownItems = <String>['None','junke', 'funmi'];
  final formKey = new GlobalKey<FormState>();
  var _dropdownValue='None';
  String _errorText;


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
                    'Almost done...',
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
                      pregnancyLength,
                      'Pregnancy length',
                      '2 months',
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
                      medicalCondition,
                      'Medical condition(if any)',
                      'e.g asthma',
                      'name',
                      1,
                      Icons.search,
                      false,
                      55,
                      315),
                  SizedBox(
                    height: height*(15/667),

                  ),
                  SizedBox(
                    height: height * (55 / 667),
                    width: width*(315/375) ,
                    child: FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                              decoration: InputDecoration(
                                filled: false,
                                hintText: 'Select Midwife name',
                                prefixIcon: Icon(Icons.person,color: Color.fromRGBO(18, 77, 157,1.0),),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(height*(11 / 667))),
                                labelText:
                                _dropdownValue == '' ? 'Midwives/HealthCareWorker name' : 'Midwives/healthCareWorker',
                                errorText: _errorText,
                              ),
                              isEmpty: _dropdownValue == '',
                              child: DropdownButtonHideUnderline(
                                child: new DropdownButton(
                                  value:_dropdownValue ,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    print('value change');
                                    print(newValue);
                                    setState(() {
                                      _dropdownValue = newValue;

                                    });
                                  },
                                  items: _dropdownItems.map(( value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                        ;
                      },
                    ),
                  )

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
                'done',
                'Done',
                Colors.white,
                18,
                FontWeight.w600,
                55,
                334,
                    () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                     LoginPage()));
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
