import 'package:flutter/cupertino.dart';

class BottomNavigationProvider with ChangeNotifier{
int _selectedIndex=0;
int get selectedIndex=>_selectedIndex;
/*changeIndex start here*/
void changeIndex(int index){
  _selectedIndex=index;
  notifyListeners();
}
/*changeIndex end here*/
}