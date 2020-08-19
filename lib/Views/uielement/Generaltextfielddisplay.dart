import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/ViewModels/BaseModel.dart';
import 'package:hackthon/Views/uielement/sharedFile.dart';
import 'package:provider_architecture/provider_architecture.dart';



class GeneralTextField extends StatelessWidget {
  final TextInputType keyInputType;
  final TextEditingController textFieldController;
  final int textFieldLineSpan;
  final String textFieldLabel;
  final String textFieldHint;
  final dynamic functionValue;
  final String choosePage;
  final IconData icon;
  final bool isIcon;
  final double height;
  final double width;

  const GeneralTextField(
    this.choosePage,
    this.keyInputType,
    this.textFieldController,
    this.textFieldLabel,
    this.textFieldHint,
    this.functionValue,
    this.textFieldLineSpan, this.icon, this.isIcon, this.height, this.width,
  );

  int isValidPhoneNumber(String input) {
    var potentialNumber = int.tryParse(input);
    return potentialNumber;
  }

  bool isValidPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidBTC(String value) {
    String pattern =
        r'^(\d*\.)?\d+$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return ViewModelProvider<BaseModel>.withConsumer(
        onModelReady: (model){
      model.setUserId();
      model.setThemeValue();
    },
    disposeViewModel: false,
    viewModelBuilder: ()=>BaseModel(),
    builder: (context,model,child)=> SafeArea(
        child: Container(
          height:height, /*choosePage=='Login'?dynamicSize.height(64 / 667):choosePage=='tradePage'?dynamicSize.height(28 / 667):dynamicSize.height(58 / 667),*/
          width:width, /*choosePage=='tradePage'?dynamicSize.width(142 / 375):dynamicSize.width(314 / 375),*/
          child: TextFormField(
            cursorColor: Colors.black,
            keyboardType: keyInputType,
            controller: textFieldController,
            maxLines: textFieldLineSpan,
            autofocus: false,
            validator: (value) {
              if (functionValue == 'email') {
                return isValidEmail(value)
                    ? null
                    : 'Please enter a valid email address';

              }
              else if(functionValue=='password'){
                return value.length<6? 'Password is too weak and invalid':null;
              }
              else if (functionValue=='NIN'){
                var nin = int.tryParse(value);
                if (nin == null && nin<8){
                  return 'Nin value is invalid';
                }
              }
              else if(functionValue == 'pin'){
                var pin =int.tryParse(value);
                return pin!=null && value.length==4 ?null:
                'Enter a 4 digit number';
              }
              else if(functionValue=='number'){
                var number =double.tryParse(value);
                return number!=null ?null:
                'Enter a Valid number';
              }
              else if(functionValue=='btc'){
                return isValidBTC(value)
                    ? null
                    : 'Please enter a valid btc amount';
              }

              else if (functionValue == 'name') {
                return value.isEmpty ? 'Value  is required' : null;
              }
              else if (functionValue=='workPhone' || functionValue=='mobilePhone'){
                var potentialNumber = int.tryParse(value);
                if (potentialNumber == null) {
                  return 'Enter a phone number';
              }

              return null;
            }
              return null;
              },
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: choosePage== 'tradePage'?dynamicSize.height(13 / 667):dynamicSize.height(15 / 667),
                fontWeight: FontWeight.w600),
            autocorrect: true,
            decoration: InputDecoration(
                labelText: '$textFieldLabel',
                hintStyle: GoogleFonts.roboto(
                    fontSize:  dynamicSize.height(13 / 667),
                    color: Color.fromRGBO(170, 170, 170, 0.8)),
                hintText: '$textFieldHint',
                suffixIcon: isIcon==true?Icon(icon,color:
                Color.fromRGBO(17, 88, 157, 1.0),size:dynamicSize.height(20/667) ,):null,
                labelStyle: GoogleFonts.roboto(
                    fontSize: dynamicSize.height(13 / 667),
                    color: Colors.black54,
                    fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.fromLTRB(
                    choosePage== 'tradePage'?dynamicSize.width(2 / 357):dynamicSize.width(20 / 357),
                    choosePage== 'tradePage'?dynamicSize.width(10 / 357):dynamicSize.height(20 / 667),
                    choosePage== 'tradePage'?dynamicSize.width(2 / 357):dynamicSize.width(2 / 357),
                    dynamicSize.height(2 / 667)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: model.color2?? Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid),
                    borderRadius:
                    BorderRadius.circular(dynamicSize.height(11 / 667))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: model.color2 ?? Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid),
                    borderRadius:
                        BorderRadius.circular(dynamicSize.height(11 / 667)))),
          ),
        ),
      ),
    );
  }
}
