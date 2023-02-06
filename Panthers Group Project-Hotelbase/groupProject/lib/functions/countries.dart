import 'package:groupProject/functions/hotelinfo.dart';
import 'mainMenu.dart';
import 'countryFunc.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';

final console = Console();
File file = File("Accounts/Accounts.txt"); //OPENS FILE
int countryIndex;
void countries() {
  console.clearScreen();
  console.rawMode = true; //TAKES THE STDIN IN TO LISTEN MODE FOR KEYS
  console.cursorPosition = Coordinate(
      3,
      stdout.terminalColumns ~/ 2 -
          ("***CHOOSE THE COUNTRY YOU WANT TO VISIT***".length ~/ 2));
  console.setForegroundColor(ConsoleColor.blue);
  console.write("***CHOOSE THE COUNTRY YOU WANT TO VISIT***");
  console.setForegroundColor(ConsoleColor.red);

  //SHOWS THE COUNTRIES TO CHOOSE ONE OF THEM
  //SYNTAX FOR MANIPULATING THE TERMINAL BY COORDINATES
  console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2 - 3,
      stdout.terminalColumns ~/ 2 - "1-) T U R K E Y ".length ~/ 2);
  console.writeLine("1-) T U R K E Y ");
  console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2,
      stdout.terminalColumns ~/ 2 - "1-) T U R K E Y ".length ~/ 2);
  console.writeLine("2-) E N G L A N D ");
  console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2 + 3,
      stdout.terminalColumns ~/ 2 - "1-) T U R K E Y ".length ~/ 2);
  console.writeLine("3-) M O R O C C O ");
  console.cursorPosition = Coordinate(stdout.terminalLines - 5, 0);

  console.write("<=== PRESS LEFT ARROW TO GO BACK");

  Key readKey = console.readKey(); //READ KEY FOR COUNTRY NAMES

  if (readKey.char == '1') {
    console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2 - 3,
        stdout.terminalColumns ~/ 2 - "1-) T U R K E Y ".length ~/ 2);
    // CHANGES THE COLOR AS A VISUAL EFFECT
    console.setForegroundColor(ConsoleColor.blue);
    console.writeLine("1-) T U R K E Y ");
    sleep(Duration(milliseconds: 576));
    console.setForegroundColor(ConsoleColor.red);
//TO CALL FROM  THE MAP GIVES THEM COUNTRY INDEX
    countryIndex = 1;
    country();
  } else if (readKey.char == '2') {
    console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2,
        stdout.terminalColumns ~/ 2 - "1-) T U R K E Y ".length ~/ 2);
    console.setForegroundColor(ConsoleColor.blue);
    console.writeLine("2-) E N G L A N D ");
    sleep(Duration(milliseconds: 576));

    console.setForegroundColor(ConsoleColor.red);
    countryIndex = 2;
    country();
  } else if (readKey.char == '3') {
    console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2 + 3,
        stdout.terminalColumns ~/ 2 - "1-) T U R K E Y ".length ~/ 2);
    console.setForegroundColor(ConsoleColor.blue);
    console.writeLine("3-) M O R O C C O ");
    sleep(Duration(milliseconds: 576));

    console.setForegroundColor(ConsoleColor.red);
    countryIndex = 3;
    country();
  } else if (readKey.controlChar == ControlCharacter.arrowLeft) {
    console.cursorPosition = Coordinate(stdout.terminalLines - 5, 0);
    console.setForegroundColor(ConsoleColor.blue);
    console.write("<=== PRESS LEFT ARROW TO GO BACK");
    sleep(Duration(milliseconds: 576));

    console.setForegroundColor(ConsoleColor.red);

    return menu();
  } else {
    countries();
  }
}
