import 'mainMenu.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';

final console = Console();
//THAT'S A COUNTDOWN FOR LOGGED OF
void returningMain() {
  console.clearScreen();
  console.showCursor();
  console.setForegroundColor(ConsoleColor.brightRed);
  console.clearScreen();
  console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2,
      stdout.terminalColumns ~/ 2 - "LOGGED OFF".length);
  console.writeLine("LOGGED OFF");
  console.cursorPosition = Coordinate(
      stdout.terminalLines ~/ 2 + 1,
      stdout.terminalColumns ~/ 2 -
          "GOING BACK TO THE MAIN MENU IN   SECONDS...".length);

  console.writeLine("GOING BACK TO THE MAIN MENU IN   SECONDS...");
  for (int i = 3; i >= 0; i--) {
    sleep((Duration(seconds: 1)));
    console.cursorPosition = Coordinate(
        stdout.terminalLines ~/ 2 + 1, stdout.terminalColumns ~/ 2 - 12);

    console.write("$i ");
  }
  return menu();
}
