import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/welcomeExit.dart';
import 'package:groupProject/functions/mainMenu.dart';

final console = Console();
File file = File("Accounts/Accounts.txt"); //OPENS FILE
bool bLoginCheck = false;

/*dart_console 1.0.0 (https://pub.dev/packages/dart_console) , 
date_util 0.1.4(https://pub.dev/packages/date_util) 
Dart Libraries used in this application  
*/

void main() {
  animationScreen(); //Calls the starting animation function

  while (true) {
    console.hideCursor();

    menu();
  }
}
