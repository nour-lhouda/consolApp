import 'package:groupProject/functions/reservations.dart';
import 'package:groupProject/functions/calendar.dart';
import 'createAccount.dart';
import 'returningMain.dart';
import 'welcomeExit.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/login.dart';
import 'package:groupProject/functions/hotelinfo.dart';

final console = Console();
File file = File("Accounts/Accounts.txt"); //OPENS FILE
bool bLoginCheck = false; //LOGIN BOOLEAN

void menu() {
  //HIDES THE CURSOR
  console.hideCursor();
  sleep((Duration(milliseconds: 0500)));
  console.clearScreen();
  console.rawMode = true;
  console.setBackgroundColor(ConsoleColor.white);
  console.setForegroundColor(ConsoleColor.brightBlue);
  console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.3).round(),
      (stdout.terminalColumns ~/ 2 -
          "**** WELCOME TO THE HOTELBASE ****".length ~/ 2));
  //WELCOME MESSAGE
  console.writeLine("**** WELCOME TO THE HOTELBASE ****");
  console.setForegroundColor(ConsoleColor.magenta);

  //cursor movement relative to terminal size
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.4).round(),
      (stdout.terminalColumns ~/ 2 - "1-SIGNUP".length));
  console.writeLine("1-SIGN UP");
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.5).round(),
      stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
  console.writeLine("2-LOGIN");
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.6).floor(),
      stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
  console.writeLine("3-FIND A HOTEL");
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.7).floor(),
      stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
  console.writeLine("4-EXIT");
//If bLoginCheck is true 5th and 6th options will be printed.
  if (bLoginCheck == true) {
    console.cursorPosition = Coordinate((stdout.terminalLines * 0.8).floor(),
        stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
    console.writeLine("5-RESERVATIONS");
    console.cursorPosition = Coordinate((stdout.terminalLines * 0.9).floor(),
        stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);

    console.writeLine("6-LOG OUT");
  }
  console.hideCursor();
  Key codeUnit = console.readKey();
//If the key char is equals 1 call sign up
  if (codeUnit.char == "1") {
    console.hideCursor();
    if (bLoginCheck == true) {
      console.setForegroundColor(ConsoleColor.brightRed);
      console.clearScreen();
      console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2,
          stdout.terminalColumns ~/ 2 - "TO SIGNUP LOG OUT FIRST!".length);
      console.writeLine("TO SIGNUP LOG OUT FIRST!");
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

    console.setForegroundColor(ConsoleColor.blue);
    console.cursorPosition = Coordinate((stdout.terminalLines * 0.4).round(),
        (stdout.terminalColumns ~/ 2 - "1-SIGNUP".length));
    console.writeLine("1-SIGN UP");
    console.setForegroundColor(ConsoleColor.magenta);
    sleep(Duration(milliseconds: 576));

    console.clearScreen();
    account();
    //If the key char is equals 2 call login
  } else if (codeUnit.char == "2") {
    if (bLoginCheck == false) {
      console.hideCursor();
      console.setForegroundColor(ConsoleColor.blue);
      console.cursorPosition = Coordinate((stdout.terminalLines * 0.5).round(),
          stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
      console.writeLine("2-LOGIN");
      console.setForegroundColor(ConsoleColor.magenta);
      sleep(Duration(milliseconds: 576));
      console.clearScreen();

      login();
    } else if (bLoginCheck == true) {
      console.setForegroundColor(ConsoleColor.brightRed);
      console.clearScreen();
      console.cursorPosition = Coordinate(stdout.terminalLines ~/ 2,
          stdout.terminalColumns ~/ 2 - "YOU ALREADY LOGGED IN".length);
      console.writeLine("YOU ALREADY LOGGED IN");
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
    //If the key char is equals 3 call calendar
  } else if (codeUnit.char == "3") {
    console.hideCursor();
    console.setForegroundColor(ConsoleColor.blue);
    console.cursorPosition = Coordinate((stdout.terminalLines * 0.6).floor(),
        stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
    console.writeLine("3-FIND A HOTEL");
    console.setForegroundColor(ConsoleColor.magenta);
    sleep(Duration(milliseconds: 576));
    console.clearScreen();
    console.resetCursorPosition();

    calendar();
  } //If the key char is equals 4 call exit
  else if (codeUnit.char == "4") {
    console.hideCursor();
    console.setForegroundColor(ConsoleColor.blue);
    console.cursorPosition = Coordinate((stdout.terminalLines * 0.7).floor(),
        stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
    console.writeLine("4-EXIT");
    console.setForegroundColor(ConsoleColor.magenta);
    sleep(Duration(milliseconds: 576));
    console.clearScreen();

    exitApplication();
  }

  if (bLoginCheck == true) {
    //If user logged in
    //If the key char is equals 5 call reservations

    if (codeUnit.char == "5") {
      console.hideCursor();
      console.cursorPosition = Coordinate((stdout.terminalLines * 0.8).floor(),
          stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
      console.setForegroundColor(ConsoleColor.blue);
      console.writeLine("5-RESERVATIONS");
      console.setForegroundColor(ConsoleColor.magenta);
      sleep(Duration(milliseconds: 576));
      console.clearScreen();

      reservations();
    }
  }
  //If user logged in
  //If the key char is equals 5 call reservations
  if (bLoginCheck == true) {
    if (codeUnit.char == "6") {
      loginCheckBeforePayment = false;
      console.hideCursor();
      console.cursorPosition = Coordinate((stdout.terminalLines * 0.9).floor(),
          stdout.terminalColumns ~/ 2 - "1-SIGNUP".length);
      console.setForegroundColor(ConsoleColor.blue);
      console.writeLine("6-LOG OUT");
      console.setForegroundColor(ConsoleColor.magenta);
      sleep(Duration(milliseconds: 576));

      bLoginCheck = false;

      returningMain();
      console.clearScreen();
    }
  } else {
    print("\n\n");
    console.writeLine(
        "PRESS ANY KEY TO RETURN MAIN MENU", TextAlignment.center);
    print("\n\n");
    console.writeLine("PRESS 'ESC' TO EXIT", TextAlignment.center);

    Key keycode = console.readKey();
    if (keycode.controlChar == ControlCharacter.unknown) {
      return exitApplication();
    } else {
      return menu();
    }
  }
}
