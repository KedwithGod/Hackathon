import 'dart:async';
import 'package:hackthon/Model/Bloc_settings.dart';

import 'package:quiver/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainBloc extends BloCSetting {


  var specificTradeVal;
  var tutorOption;
  var noOfUser;
  var indexValue;
  var langChange='english';
  var unlock=false;
  bool loading=false;
  String radioButton;
  var langDialog=false;
  // unlock screen

  updateLang(value) async {
   langChange=value;
    await rebuildWidgets(ids: ['langChange']);
  }

  changeLangDialog(value) async {
    langDialog=value;
    await rebuildWidgets(ids: ['langDialog']);
  }


  updateRadioButton(value) async{
    radioButton=value;
    SharedPreferences theme= await SharedPreferences.getInstance();
    theme.setString('themeValue', value);
    await rebuildWidgets(ids: ['radioButton']);
  }


  initRadioButton() async {
    SharedPreferences theme= await SharedPreferences.getInstance();
    radioButton=theme.getString('themeValue') ?? 'blue';
    await rebuildWidgets(ids: ['radioButton']);
  }

  setLoading() async {
    loading=!loading;
    await rebuildWidgets(ids: ['Sign in']);
  }


  // index stack selection handler

  onSwipeRight() async{
    indexValue > 0 ? indexValue-- : indexValue = 0;
    print(indexValue);
    await rebuildWidgets(ids: ['swipeDetector','indexStack']);
  }

  onSwipeLeft() async {
    indexValue < 2 ? indexValue++ : indexValue = 2;
    await rebuildWidgets(ids: ['swipeDetector','indexStack',]);
    print(indexValue);
  }

  indexChange(int index) async {
    indexValue = index;
    await rebuildWidgets(ids: ['indexStack','swipeDetector']);
  }

  nullField(){
    return null;
  }
  int _elapsed=0;
  int get elapsed=>_elapsed*6==90?_elapsed=0:_elapsed=_elapsed;




  loadingWidget(){
    try{
      final cd = CountdownTimer(Duration(seconds: 15), Duration(seconds: 1));
      cd.listen((data) async{
        _elapsed = cd.elapsed.inSeconds;
        await rebuildWidgets(ids: ['timer']);
      }, onDone: () {
        cd.cancel();
      }, onError: (e){
        print(e.toString());
      });
    }catch(e){
      print(e.toString());
    }
  }

  Timer _timer;
  int _start = 0;
  int get start=>_start;

  startTimer() async {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
            (Timer timer)  {
          if (_start ==15) {
            timer.cancel();
            _start=0;
          } else {
            _start = _start +1;
            rebuildWidgets(ids: ['timer']);
          }
        }

    );
    print('start: $_start');

  }



  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
MainBloc mainBloc;


