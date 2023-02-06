import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/countries.dart';
import 'welcomeExit.dart';
import 'dart:io';

final console = Console();
int room;
//This function for choosing room numbers.
void rooms() {
  console.clearScreen();
  console.setForegroundColor(ConsoleColor.blue);
  //Changing the cursor positions
  console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.3).round(),
      (stdout.terminalColumns * 0.5).round() -
          ("***SELECT THE ROOM NUMBERS***".length * 0.5).round());
  console.writeLine("***SELECT THE ROOM NUMBERS***");
  console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.5).round(),
      (stdout.terminalColumns * 0.5).round() -
          ('*ROOM NUMBER*'.length * 0.5).round());
  console.writeLine('*ROOM NUMBER*');

  console.setForegroundColor(ConsoleColor.red);

//Calendar type menu for choosing room number.
  for (int i = 1; i > 0; i--) {
    console.cursorPosition = Coordinate(
        (stdout.terminalLines * 0.6).round(),
        ((stdout.terminalColumns * 0.5).round() -
                    ('*ROOM NUMBER*'.length * 0.5).round() * 0.5)
                .round() +
            1);

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
      if (i <= 5) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      room = i;

      break;
    } else {
      print("\n\n\nSelect Room Number");
      i++;
      continue;
    }
  }
  return countries();
}
