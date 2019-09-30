import 'package:flutter/foundation.dart';

class MainModel with ChangeNotifier{

	String title = "Provider demo";
	String indicator = "You have pushed the button this many times:";

	int counter = 0;

    void incrementCounter() {
          counter++;
		  notifyListeners();
    }
}