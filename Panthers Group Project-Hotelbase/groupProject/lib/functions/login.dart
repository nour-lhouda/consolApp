import 'mainMenu.dart';
import 'package:groupProject/functions/hotelinfo.dart';
import 'package:groupProject/functions/payment.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';

var userNameRegex = RegExp(r"^(?=.*[A-Za-z])(?=.*)[A-Za-z\d.-]{5,16}$");
var id;
var passwordRegex =
    RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");

final console = Console();
File file = File("Accounts/Accounts.txt"); //OPENS FILE
/*Login page */
void login() {
  console.clearScreen();
  List<String> lines = file.readAsLinesSync();

  bLoginCheck = false;
  //PRINTS THE WELCOME MESSAGE
  console.rawMode = true;
  console.setForegroundColor(ConsoleColor.cyan);
  console.writeLine("**--LOGIN THE APPLICATION--**", TextAlignment.center);
  console.setForegroundColor(ConsoleColor.red);
  console.writeLine(
            "USERNAME SHOULD BE 5-16 CHARACTERS LONG YOU CAN ONLY USE THESE SPECIAL CHARACTERS ('.  _')",
      TextAlignment.center);
  console.writeLine(
      "PASSWORD SHOULD CONTAIN MINIMUM 8 CHARACTERS,AT LEAST ONE LOWERCASE LETTER, ONE NUMBER and ONE SPECIAL CHARACTER(@\$!%*#?&) ",
      TextAlignment.center);
  console.showCursor();
  console.setForegroundColor(ConsoleColor.magenta);
  //MOVES THE CURSOR WE ARE USING THIS BECAUSE OF DIFFERENT RESOLUTIONS OF THE TERMINAL
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.4).floor(), 0);
//IT TAKES THE USERNAME AS AN INPUT
  console.write("USERNAME :");
  console.setForegroundColor(ConsoleColor.blue);
  id = console.readLine();
  console.setForegroundColor(ConsoleColor.magenta);
  //CHECKING THE REGEX IF ITS FALSE LOOP BACK AND TAKES THE INPUT AGAIN
  while (true) {
    if (id == "" || userNameRegex.hasMatch(id) == false || id == null) {
      console.cursorPosition = Coordinate(
          (stdout.terminalLines * 0.4).floor(),
          stdout.terminalColumns ~/ 2 -
              "***INVALID USERNAME READ REQUIREMENTS***".length);
      console.setForegroundColor(ConsoleColor.brightRed);
      //SHOWS AN ERROR MESSAGE WITH DIFFERENT TEXT COLOUR
      console.write("***INVALID USERNAME READ REQUIREMENTS***");
      console.setForegroundColor(ConsoleColor.magenta);
      console.cursorPosition =
          Coordinate((stdout.terminalLines * 0.4).floor(), "USERNAME :".length);
      console.setForegroundColor(ConsoleColor.blue);
      id = console.readLine();
      console.setForegroundColor(ConsoleColor.magenta);
    } else {
      break;
    }
  }
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.6).floor(), 0);
  console.write("PASSWORD :");
  console.setForegroundColor(ConsoleColor.blue);
  //TAKES THE PASSWORD AS AN INPUT
  var password = console.readLine();
  console.setForegroundColor(ConsoleColor.magenta);
  //CHECKING THE REGEX IF ITS FALSE LOOP BACK AND TAKES THE INPUT AGAIN
  while (true) {
    if (password == "" || passwordRegex.hasMatch(password) == false) {
      console.cursorPosition = Coordinate(
          (stdout.terminalLines * 0.6).floor(),
          stdout.terminalColumns ~/ 2 -
              "***INVALID PASSWORD READ REQUIREMENTS***".length);
      console.setForegroundColor(ConsoleColor.brightRed);
      //SHOWS AN ERROR MESSAGE WITH DIFFERENT TEXT COLOUR
      console.write("***INVALID PASSWORD READ REQUIREMENTS***");
      console.setForegroundColor(ConsoleColor.magenta);
      console.cursorPosition =
          Coordinate((stdout.terminalLines * 0.6).floor(), "PASSWORD :".length);
      console.setForegroundColor(ConsoleColor.blue);
      password = console.readLine();
      console.setForegroundColor(ConsoleColor.magenta);
    } else {
      break;
    }
  }
  console.hideCursor();
  for (int i = 0; i < lines.length; i++) {
    //SPLIT THE FIRST INDEX OF ACCOUNTS' TEXT LINES LIST
    String checkId = lines[i].split("|")[0];
    //SPLIT THE SECOND INDEX OF ACCOUNTS' TEXT LINES LIST
    String pass = lines[i].split("|")[1];
    //AND COMPARE LOGIN ID INPUT AND PASSWORD INPUT
    if (id == checkId && pass == password) //
    {
      //LOGIN CHECK
      bLoginCheck = true;
      break;
    }
  }
  //SUCCESSFUL LOGIN MESSAGE
  if (bLoginCheck == true) {
    console.setForegroundColor(ConsoleColor.brightRed);
    console.cursorPosition =
        Coordinate((stdout.terminalLines * 0.7).round(), 0);
    console.writeLine("SUCCESSFULLY LOGGED IN");
    //PAYMENT REDIRECTING BOOL IF ITS TRUE RETURN PAYMENT
    if (loginCheckBeforePayment == true) {
      sleep(Duration(seconds: 2));

      return payment();
    }
  }
  //IF LOGIN IS UNSUCCESSFUL
  if (bLoginCheck == false) {
    console.cursorPosition =
        Coordinate((stdout.terminalLines * 0.8).round(), 0);
    console.setForegroundColor(ConsoleColor.brightRed);

    console.writeLine("ID OR PASSWORD IS WRONG!!!!");

    console.setForegroundColor(ConsoleColor.brightRed);

    console.cursorPosition =
        Coordinate((stdout.terminalLines * 0.9).round(), 0);

    console.writeLine("GOING BACK TO THE MAIN MENU IN   SECONDS...");
    //SLEEP AND COUNTDOWN
    for (int i = 3; i >= 0; i--) {
      sleep((Duration(seconds: 1)));
      console.cursorPosition = Coordinate((stdout.terminalLines * 0.9).round(),
          "GOING BACK TO THE MAIN MENU IN   SECONDS...".length - 12);

      console.setForegroundColor(ConsoleColor.blue);
      console.write("$i ");
      console.setForegroundColor(ConsoleColor.red);
    }
    return menu();
  }

  console.setForegroundColor(ConsoleColor.brightRed);

  console.cursorPosition = Coordinate((stdout.terminalLines * 0.8).round(), 0);

  console.writeLine("GOING BACK TO THE MAIN MENU IN   SECONDS...");
  for (int i = 3; i >= 0; i--) {
    sleep((Duration(seconds: 1)));
    console.cursorPosition = Coordinate((stdout.terminalLines * 0.8).round(),
        "GOING BACK TO THE MAIN MENU IN   SECONDS...".length - 12);

    console.setForegroundColor(ConsoleColor.blue);
    console.write("$i ");
    console.setForegroundColor(ConsoleColor.red);
  }
  return menu();
}
