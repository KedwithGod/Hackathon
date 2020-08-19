import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackthon/ViewModels/BaseModel.dart';
import 'package:hackthon/ViewModels/addCardViewModel.dart';
import 'package:hackthon/Views/growthMonitoringPage/checkPreviousData.dart';
import 'package:hackthon/Views/uielement/AdaptivePostionedWidget.dart';
import 'package:hackthon/Views/uielement/Generalbuttondisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextdisplay.dart';
import 'package:hackthon/Views/uielement/Generaltextfielddisplay.dart';
import 'package:hackthon/Views/uielement/sizedBox.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:random_string/random_string.dart';

class AddCardDetails extends StatelessWidget {
  final entryValue =TextEditingController();
  final entryName=TextEditingController();
  final GlobalKey _formKey=GlobalKey();
  final GlobalKey _formKey1=GlobalKey();
  final controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    customDialog(double x, double y, child) {
      return Align(
        alignment: Alignment(x, y),
        child: Material(
          color: Color.fromRGBO(255,255,255,0.85),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: child
          ),

        ),
      );
    }


    return ViewModelProvider<AddCardViewModel>.withConsumer(
      onModelReady: (model) {
        model.networkConnection();
        model.setUserId();
        print(model.userId);
        model.getJobType();
        model.getJobId();
      },
      viewModelBuilder: () =>AddCardViewModel(),
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
          :  SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
          children: <Widget>[
            AdaptivePositioned(
              left: 0,
              top: 0,
              child: Container(
                height:height*(213/667) ,
                width: width,
                color: Color.fromRGBO(20, 78, 162, 1.0),
              ),
            ),

            AdaptivePositioned(
              left: 24,
              top: 20,
              child: IconButton(icon: Icon(Icons.menu,
                size:height*(25/667),color: Colors.white,),
                  onPressed:(){}),
            ),
            AdaptivePositioned(
              left: 124,
              top: 29,
              child: GeneralTextDisplay(model.patientData!=null?
              model.patientData['userName']:'Patrick ivon', Colors.white, 1,
                  20, FontWeight.w600, 'patient name'),
            ),
            AdaptivePositioned(
              left:307 ,
              top: 21,
              child: Container(
                  height:height*(40/667) ,
                  width:height*(40/667) ,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/mother.jpg'),
                      fit: BoxFit.cover),
                      shape: BoxShape.circle
                  )),
            ),
            AdaptivePositioned(
              left: 24,
              top: 79,
              child: GeneralTextDisplay('Add Card details', Colors.white, 1,
                  20, FontWeight.bold, 'card details'),
            ),
            AdaptivePositioned(
              left: 24,
              top: 123,
              child: AdaptiveSizedBox(
                height:(239/667) ,
                width: (334/375),
                child: Material(
                  elevation: 5.0,
                  shadowColor: Colors.white,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(
                      height*(28/667)
                  )),
                  child: Stack(
                    children: <Widget>[
                      AdaptivePositioned(
                        left: 22,
                        top: 19,
                        child: Text('Input card details',
                          style: GoogleFonts.ropaSans(
                              color: Color.fromRGBO(18, 77, 157, 1.0),
                              fontSize: 19,
                              fontWeight: FontWeight.w400),
                        )
                      ),
                      AdaptivePositioned(
                        left:23,
                        top: 56,
                        child: Form(
                          key:_formKey,
                          child: GeneralTextField(
                            '',
                            TextInputType.text,
                            entryName,
                            'Entry Name',
                            'Entry name e.g weight',
                            'name',
                            1,
                            Icons.search,
                            false,
                            42,
                            280),
                        ),
                    ),
                      AdaptivePositioned(
                        left:23,
                        top: 112,
                        child: Form(
                          key: _formKey1,
                          child: GeneralTextField(
                              '',
                              TextInputType.text,
                              entryValue,
                              'Entry Value',
                              'Entry value e.g 40 kg',
                              'name',
                              1,
                              Icons.search,
                              false,
                              42,
                              280),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 28,
                        top: 183,
                        child: GeneralButton(
                          '',
                          1,
                          'new entry',
                            'New entry',
                          Colors.white,
                          17,
                          FontWeight.w400,
                          39,
                          140,
                            (){
                            model.validateData(_formKey,_formKey1,entryName, entryValue);
                            entryName.clear();
                            entryValue.clear();
                            },
                          11,11,11,11,
                          Color.fromRGBO(18, 77, 157, 1.0),
                          Colors.white,
                          2.0),
                    ),
                      AdaptivePositioned(
                        left: 183,
                        top: 183,
                        child: GeneralButton(
                            'border',
                            1,
                            'done',
                            'Done',
                            Colors.black,
                            17,
                            FontWeight.w400,
                            39,
                            131,
                                (){
                              model.dataEntry==null?null:
                                  showDialog(
                                          context: context,
                                          builder: (context) {
                                           List list=[];
                                           model.dataEntry.forEach((key, value) {
                                              list.add(value);
                                           });
                                            return customDialog(
                                                0.0,
                                                0.0,
                                                Column(
                                                  children: <Widget>[
                                                    GeneralTextDisplay(
                                                        'This are the data you entered', Color.fromRGBO(0, 0, 191, 1.0),
                                                        1,
                                                        18,
                                                        FontWeight.bold,
                                                        'LIst of data'),
                                                    SizedBox(
                                                      height: height*(15/667),
                                                    ),
                                                    ListView.builder(
                                                      itemCount:list??1,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return ListTile(
                                                          leading:
                                                              GeneralTextDisplay(
                                                                  '${index+1}',
                                                                  Colors.black,
                                                                  1,
                                                                  14,
                                                                  FontWeight.w500,
                                                                  ''),
                                                          title:
                                                              GeneralTextDisplay(
                                                                list[index],
                                                                  Colors.black,
                                                                  1,
                                                                  17,
                                                                  FontWeight.w500,
                                                                  ''),
                                                          trailing: IconButton(
                                                              icon: Icon(
                                                                Icons.delete,
                                                                size: height *
                                                                    (20 / 667),
                                                                color:
                                                                    Colors.black,
                                                              ),
                                                              onPressed: () {
                                                                Scaffold.of(context).showSnackBar(SnackBar(
                                                                    content: Text("item deleted"),
                                                                    action: SnackBarAction(
                                                                        label: "UNDO",
                                                                        onPressed: () {
                                                                          var item = list.elementAt(index);
                                                                          //To undo deletion
                                                                          model.undoSelection(list,index, item);
                                                                        })));
                                                                var item = list.elementAt(index);
                                                                model.removeDataEntryKey(list[index]);
                                                                model.removeListItem(list, item);
                                                              }),
                                                        );
                                                      },
                                                    ),

                                                    GeneralButton(
                                                            '',
                                                            1,
                                                            'confirm',
                                                            'Confirm',
                                                            Color.fromRGBO(18, 77, 157, 1.0),
                                                            17,
                                                            FontWeight.w500,
                                                            40,
                                                            140,
                                                        (){
                                                              Navigator.pop(context);
                                                        },
                                                            11,11,11,11,
                                                            Colors.white,
                                                           Colors.white,
                                                            4.0)
                                                      ],
                                                ));
                                          });
                                    },
                            11,11,11,11,
                            Colors.white,
                            Colors.white,
                            2.0),
                      ),



                    ],
                  ),
                ),
              ),
            ),
            AdaptivePositioned(
              left: 144,
              top: 393,
              child: GeneralTextDisplay('OR', Color.fromRGBO(0, 0, 191, 1.0), 1,
                  25, FontWeight.bold, 'patient name'),
            ),
            AdaptivePositioned(
              left: 24,
              top: 454,
              child: Builder(
                builder:(context)=> AdaptiveSizedBox(
                  height:(91/667) ,
                  width: (334/375),
                  child: Material(
                    elevation: 5.0,
                    shadowColor: Color.fromRGBO(242, 242, 242, 1.0),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                        height*(28/667)
                    )),
                    child: Stack(
                      children: <Widget>[
                        AdaptivePositioned(
                            left: 23,
                            top: 17,
                            child: Text('Scan Card details',
                              style: GoogleFonts.ropaSans(
                                  color: Color.fromRGBO(18, 77, 157, 1.0),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                        AdaptivePositioned(
                          left: 23,
                          top: 54,
                          child: GestureDetector(
                            onTap: () async{
                              await model.read();
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return customDialog(
                                        0.0, 0.0,
                                        Column(
                                          children: <Widget>[
                                            GeneralTextDisplay(
                                                'List of Scanned data',
                                                Color.fromRGBO(0, 0, 191, 1.0),
                                                1,
                                                18,
                                                FontWeight.bold,
                                                'LIst of data'),
                                            SizedBox(
                                              height: height*(15/667),
                                            ),
                                            SizedBox(
                                              height: height*(50/667)*model.textsOcr.length,
                                              child: SizedBox(
                                                height: height*(50/667)*model.textsOcr.length,
                                                child: ListView.builder(
                                                  key: Key(randomString(11)),
                                                  itemCount: model.textsOcr.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      leading:GeneralTextDisplay(
                                                          '${index+1}',
                                                          Colors.black,
                                                          1,
                                                          14,
                                                          FontWeight.w500,
                                                          '') ,
                                                      title: GeneralTextDisplay(
                                                          model.textsOcr[index].value,
                                                          Colors.black,
                                                          1,
                                                          17,
                                                          FontWeight.w500,
                                                          ''),
                                                      trailing: IconButton(icon: Icon(Icons.delete,size: height*(20/667),
                                                        color: Colors.black,), onPressed: (){

                                                        var item =model.textsOcr.elementAt(index);
                                                       model.removeOcrItem(item);
                                                      }),
                                                    );
                                                  },

                                                ),
                                              ),
                                            ),
                                        SizedBox(
                                          height: height*(15/667)),
                                            GeneralButton(
                                                '',
                                                1,
                                                'Save',
                                                'Confirm',
                                                Colors.white,
                                                17,
                                                FontWeight.w500,
                                                40,
                                                140,
                                                    (){
                                                  Navigator.pop(context);
                                                },
                                                11,11,11,11,
                                                Color.fromRGBO(0, 0, 191, 1.0),
                                                Colors.white,
                                                4.0)
                                          ],
                                        ));
                                              });
                                        },
                            child: GeneralTextDisplay('Open Camera', Color.fromRGBO(51, 51, 51, 1.0), 1,
                                13, FontWeight.w600, 'open camera'),
                          ),
                        ),

                        AdaptivePositioned(
                          left: 263,
                          top: 29,
                          child: IconButton(icon:Icon(MdiIcons.camera, size:
                          height*(40/667),color: Color.fromRGBO(18, 77, 157, 1.0),), onPressed: () async {
                            await model.read();
                            await showDialog(
                                context: context,
                                builder: (context) {
                              return customDialog(
                                  0.0, 0.0,
                                  Column(
                                    children: <Widget>[
                                      GeneralTextDisplay(
                                          'List of Scanned data',
                                          Color.fromRGBO(0, 0, 191, 1.0),
                                          1,
                                          18,
                                          FontWeight.bold,
                                          'LIst of data'),
                                      SizedBox(
                                        height: height*(15/667),
                                      ),
                                      SizedBox(
                                        height: height*(50/667)*model.textsOcr.length,
                                        child: ListView.builder(
                                          key: Key(randomString(11)),
                                          itemCount: model.textsOcr.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return ListTile(
                                              leading:GeneralTextDisplay(
                                                  '${index+1}',
                                                  Colors.black,
                                                  1,
                                                  14,
                                                  FontWeight.w500,
                                                  '') ,
                                              title: GeneralTextDisplay(
                                                  model.textsOcr[index].value,
                                                  Colors.black,
                                                  1,
                                                  17,
                                                  FontWeight.w500,
                                                  ''),
                                              trailing: IconButton(icon: Icon(Icons.delete,size: height*(20/667),
                                                color: Colors.black,), onPressed: (){

                                                var item =model.textsOcr.elementAt(index);
                                                model.removeOcrItem(item);
                                              }),
                                            );
                                          },

                                        ),
                                      ),
                                      SizedBox(
                                          height: height*(15/667)),
                                      GeneralButton(
                                          '',
                                          1,
                                          'Save',
                                          'Confirm',
                                          Colors.white,
                                          17,
                                          FontWeight.w500,
                                          40,
                                          140,
                                              (){
                                            Navigator.pop(context);
                                          },
                                          11,11,11,11,
                                          Color.fromRGBO(0, 0, 191, 1.0),
                                          Colors.white,
                                          4.0)
                                    ],
                                  ));
                            });
                          })
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
            AdaptivePositioned(
              left: 70,
              top: 603,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>PreviousData()));
                },
                child: GeneralTextDisplay('Check previous data',
                    Color.fromRGBO(0, 0,191, 1.0), 1,
                    17, FontWeight.w600, 'previous data'),
              ),
            ),

            AdaptivePositioned(
                left: 24,
                top: 590,
                child: IconButton(icon:Icon(MdiIcons.database, size:
                height*(23/667),color: Color.fromRGBO(18, 77, 157, 1.0),), onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>PreviousData()));
                })
            ),

          ],
        ) ,
      )
      ));
  }
}


