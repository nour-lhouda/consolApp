import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/rooms.dart';
import 'welcomeExit.dart';

final console = Console();
int adult;
int child;

void guests() {
  console.clearScreen();
  console.setForegroundColor(ConsoleColor.blue);
  console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.3).round(),
      ((stdout.terminalColumns * 0.5).round()) -
          "***SELECT THE ADULT and CHILD NUMBERS***".length ~/ 2);
  console.writeLine("***SELECT THE ADULT and CHILD NUMBERS***");
  console.cursorPosition = Coordinate(
      stdout.terminalLines ~/ 2,
      (stdout.terminalColumns * 0.5).round() -
          "***SELECT THE ADULT and CHILD NUMBERS***".length ~/ 2);
  console.writeLine('*ADULT*');
  console.cursorPosition = Coordinate(
      stdout.terminalLines ~/ 2,
      (stdout.terminalColumns ~/ 2 +
          "***SELECT THE ADULT and C***".length ~/ 2));
  console.writeLine('*CHILD*');
  console.setForegroundColor(ConsoleColor.red);

  console.rawMode = true;

  console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2 + 2,
      (stdout.terminalColumns ~/ 2 - "CHILD".length * 2 + 11));
//PUTS SLASH BETWEEN THE DATES
  console.write("/");
  //Decreasing loops for menus navigated with arrow keys
  for (int i = 1; i > 0; i--) {
    console.cursorPosition = Coordinate(
        stdout.terminalLines ~/ 2 + 2,
        (stdout.terminalColumns * 0.5).round() -
            "***SELECT THE ADULT and CHILD NUMBERS***".length ~/ 2);

    if (i < 10) {
      console.write("0");
    }
    console.write("$i");
    Key keyz = console.readKey();

    if (keyz.controlChar == ControlCharacter.arrowDown) {
      if (i > 1) {
        continue;
      } else {
        i++;
        continue;
      }
    } else if (keyz.controlChar == ControlCharacter.arrowUp) {
      if (i <= 10) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      adult = i;

      break;
    } else {
      print("\n\n\nSelect Adult Number");
      i++;
      continue;
    }
  }

  for (int i = 0; i >= 0; i--) {
    console.cursorPosition = Coordinate(
        stdout.terminalLines ~/ 2 + 2,
        (stdout.terminalColumns ~/ 2 +
            "***SELECT THE ADULT and C***".length ~/ 2));

    if (i < 10) {
      console.write("0");
    }
    console.write("$i");
    Key keyz = console.readKey();

    if (keyz.controlChar == ControlCharacter.arrowDown) {
      if (i > 1) {
        continue;
      } else {
        i++;
        continue;
      }
    } else if (keyz.controlChar == ControlCharacter.arrowUp) {
      if (i <= 3) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      child = i;

      break;
    } else {
      print("\n\n\nSelect Child Number");
      i++;
      continue;
    }
  }
  return rooms();
}
