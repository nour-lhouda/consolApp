import 'mainMenu.dart';
import 'returningMain.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/login.dart';
import 'hotelinfo.dart';

var userId;
var userPassword;
var userNameRegex =
    RegExp(r"^(?=.*[A-Za-z])(?=.*)[A-Za-z\d.-]{5,16}$"); //USER NAME REGULAR EXPRESSION

var passwordRegex = RegExp(
    r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"); //PASSWORD REGULAR EXPRESSION

final console = Console(); //CONSOLE LIBRARY DEFINING

File file = File("Accounts/Accounts.txt"); //OPENS FILE
//Creating for a new account Function

void account() {
  console.clearScreen();
  List<String> lines = file
      .readAsLinesSync(); //READING ALL ACCOUNT INFORMATION FROM THE TEXT FILE AND STORE THEM IN TO LIST

  int cAccountExist = 0;
  console.rawMode = true; //IT TAKES THE STDIN TO THE LISTENING MODE
  console.setForegroundColor(ConsoleColor.cyan);
  console.writeLine("**--CREATE YOUR ACCOUNT--**", TextAlignment.center);
  console.setForegroundColor(ConsoleColor.red);
  console.writeLine(
      "USERNAME SHOULD BE 5-16 CHARACTERS LONG YOU CAN ONLY USE THESE SPECIAL CHARACTERS ('.  _')",
      TextAlignment.center);
  console.writeLine(
      "PASSWORD SHOULD CONTAIN MINIMUM 8 CHARACTERS,AT LEAST ONE LOWERCASE LETTER, ONE NUMBER and ONE SPECIAL CHARACTER(@\$!%*#?&) ",
      TextAlignment.center);
  console.setForegroundColor(ConsoleColor.magenta);

  console.cursorPosition = Coordinate((stdout.terminalLines * 0.4).floor(), 0);

  console.write("USERNAME :");

  console.showCursor(); //SHOWING HIDED CURSOR
  console.setForegroundColor(ConsoleColor.blue);
  userId = console.readLine();
  console.setForegroundColor(ConsoleColor.magenta);
  bool errorCheck = false;
  //LOOP FOR  IN THE SAME  SAME LINE ERRORS
  //IS USER ID EMPTY OR REGEX FALSE  AND NULL CHECK FOR ERRORS

  while (true) {
    if (userId == "" ||
        userNameRegex.hasMatch(userId) == false ||
        userId == null) {
      errorCheck = true;
      if (errorCheck == true) {
        console.cursorPosition = Coordinate(
            (stdout.terminalLines * 0.4).floor(),
            stdout.terminalColumns ~/ 2 -
                "***INVALID USERNAME READ REQUIREMENTS***".length);
        console.setForegroundColor(ConsoleColor.brightRed);
        console.write(
            "***INVALID USERNAME READ REQUIREMENTS***"); //SHOWS THE ERROR MESAGE
        console.setForegroundColor(
            ConsoleColor.magenta); //CONSOLE FONT COLOR CHANGING
        console.cursorPosition = Coordinate(
            (stdout.terminalLines * 0.4).floor(), "USERNAME :".length);
        console.setForegroundColor(ConsoleColor.blue);
        userId = console.readLine();
        console.setForegroundColor(ConsoleColor.magenta);
      }
    } else {
      break;
    }
  }
  errorCheck = false;

  console.cursorPosition = Coordinate((stdout.terminalLines * 0.6).floor(), 0);
  console.write("PASSWORD :");
  console.setForegroundColor(ConsoleColor.blue);
  userPassword = console.readLine();
  console.setForegroundColor(ConsoleColor.magenta);

  while (true) {
    if (userPassword == "" || passwordRegex.hasMatch(userPassword) == false) {
      errorCheck = true;
      if (errorCheck == true) {
        console.cursorPosition = Coordinate(
            (stdout.terminalLines * 0.6).floor(),
            stdout.terminalColumns ~/ 2 -
                "***INVALID PASSWORD READ REQUIREMENTS***".length);
        console.setForegroundColor(ConsoleColor.brightRed);
        console.write("***INVALID PASSWORD READ REQUIREMENTS***");
        console.setForegroundColor(ConsoleColor.magenta);
        console.cursorPosition = Coordinate(
            (stdout.terminalLines * 0.6).floor(), "PASSWORD :".length);
        console.setForegroundColor(ConsoleColor.blue);
        userPassword = console.readLine();
        console.setForegroundColor(ConsoleColor.magenta);
      }
    } else {
      break;
    }
  }

  console.hideCursor(); //HIDES THE CURSOR

  String usernameCheck = "$userId|$userPassword";
  //FOR LOOP FOR CHECKING USER NAME IS EXIST OR NOT
  for (int i = 0; i < lines.length; i++) {
    //CHECKING THE 0 INDEX AND COMPARE WITH LIST INDEX FROM TEXT FILE
    if (usernameCheck.split("|")[0] == lines[i].toString().split("|")[0]) {
      //IF IT IS EXIST IT WILL INCREASE
      cAccountExist++;
    }
  }
  //IF IT IS 0 THEN THE USERNAME IS UNIQUE
  if (cAccountExist == 0) {
    //IF USERNAME AND USERPASSWORD REGEXES ARE CORRECT
    if (passwordRegex.hasMatch(userPassword) == true &&
        userNameRegex.hasMatch(userId) == true) {
      //WRITE THE USERNAME AND PASSWORD TO THE TXT FILE IN APPEND MODE
      file.writeAsStringSync('$userId|$userPassword\n', mode: FileMode.append);
      //APPEND MODE ALLOWS THE PROGRAM FOR WRITING TXT FILE LINE BY LINE
      console.setForegroundColor(ConsoleColor.brightRed);
      console.cursorPosition =
          Coordinate((stdout.terminalLines * 0.8).round(), 0);
      console.writeLine("YOUR ACCOUNT IS SUCCESSFULLY CREATED");
      console.cursorPosition =
          Coordinate((stdout.terminalLines * 0.9).round(), 0);
      if (loginCheckBeforePayment == true) {
        console.write("YOU ARE REDIRECTED TO THE LOGIN PAGE");
        sleep(Duration(seconds: 1));
        return login();
      }

      console.writeLine("GOING BACK TO THE MAIN MENU IN   SECONDS...");
      //COUNT DOWN FOR RETURNING MENU
      for (int i = 3; i >= 0; i--) {
        sleep((Duration(seconds: 1)));
        console.cursorPosition = Coordinate(
            (stdout.terminalLines * 0.9).round(),
            "GOING BACK TO THE MAIN MENU IN   SECONDS...".length - 12);
        console.setForegroundColor(ConsoleColor.blue);
        console.write("$i ");
        console.setForegroundColor(ConsoleColor.red);
      }
      return menu();
    } else {
      console.writeLine("INVALID ID OR PASSWORD - READ REQUIREMENTS"); //
      sleep((Duration(seconds: 1)));
      console.writeLine("RETURNING TO THE MAIN MENU...");
      //CALLS THE COUNT DOWN FUNCTION
      returningMain();
    }
  } else {
    console.setForegroundColor(ConsoleColor.brightRed);
    console.cursorPosition =
        Coordinate((stdout.terminalLines * 0.8).round(), 0);
    //IF THE ACCOUNT EXIST PRINT IT IS EXIST AS ERROR AND RETURN MAIN MENU
    console.write("THIS ACCOUNT ALREADY EXISTS");

    console.setForegroundColor(ConsoleColor.brightRed);

    console.cursorPosition =
        Coordinate((stdout.terminalLines * 0.9).round(), 0);
    if (loginCheckBeforePayment == true) {
      console.write("YOU ARE REDIRECTED TO THE LOGIN PAGE");
      sleep(Duration(seconds: 1));
      return login();
    }
    console.write("GOING BACK TO THE MAIN MENU IN   SECONDS...");
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
}
