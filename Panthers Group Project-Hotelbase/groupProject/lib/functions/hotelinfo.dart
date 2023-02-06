import 'package:groupProject/functions/calendar.dart';
import 'package:groupProject/functions/countries.dart';
import 'package:groupProject/functions/createAccount.dart';
import 'package:groupProject/functions/guests.dart';
import 'package:groupProject/functions/payment.dart';
import 'package:groupProject/functions/countryFunc.dart';
import 'package:groupProject/functions/rooms.dart';
import 'mainMenu.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/login.dart';
import 'package:groupProject/cities.dart';

final console = Console();
bool loginCheckBeforePayment;
double n = 1.0;
Key readKey;
double price;
var secondPrice;
//IT CALLED FROM TURKEY FUNCTION WITH CITY AND LINE INFORMATION PARAMETERS
void hotelInfo() {
  price = double.parse(cities[countryIndex][city][lineNumber]['price']);
  console.clearScreen(); //CLEARS THE SCREEN
  console.setForegroundColor(ConsoleColor.blue);

  console.hideCursor();
  console.cursorPosition = Coordinate(
      1,
      (stdout.terminalColumns ~/ 2) -
          (cities[countryIndex][city][lineNumber]['hotelName']
                  .toString()
                  .length ~/
              2) +
          1);
  //HOTEL NAME INFORMATION FROM CITY MAPS
  console.writeLine(
      "${cities[countryIndex][city][lineNumber]['hotelName'].toString().toUpperCase()}");
  print("\n\n\n\n");
  console.setForegroundColor(ConsoleColor.magenta);
  console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.25).round(),
      (stdout.terminalColumns ~/ 2) -
          "RATING : ${cities[countryIndex][city][lineNumber]['rating']}"
                  .length ~/
              2);
  //RATING INFORMATION OF HOTEL
  console.writeLine(
      "RATING : ${cities[countryIndex][city][lineNumber]['rating']}");
  console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.3).round(),
      (stdout.terminalColumns ~/ 2) -
          "RATING : ${cities[countryIndex][city][lineNumber]['rating']}"
                  .length ~/
              2);
  //STAR INFORMATION OF HOTEL
  console
      .writeLine("STARS : ${cities[countryIndex][city][lineNumber]['star']}");
  if (room > 1) {
    n *= room.toDouble();
  }
  if (adult > 2) {
    price += 1 / 2 * price * (adult - 2);
  }
  if (child >= 2) {
    price += 1 / 5 * price * (child / 2 - 0.5);
  }
  if (reservationDay > 1) {
    n *= reservationDay;
  }
  secondPrice = (n * price).round();
  console.cursorPosition = console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.35).floor(),
      (stdout.terminalColumns ~/ 2) -
          "RATING : ${cities[countryIndex][city][lineNumber]['rating']}"
                  .length ~/
              2);
  console.writeLine('PRICE : ₺${((n * price) / reservationDay).round()}/night');
  console.setForegroundColor(ConsoleColor.blue);
  console.cursorPosition = Coordinate(
      (stdout.terminalLines * 0.40).floor(),
      (stdout.terminalColumns ~/ 2) -
          "RATING : ${cities[countryIndex][city][lineNumber]['rating']}"
                  .length ~/
              2);

  //PRICE INFORMATION OF OTEL
  console.writeLine('TOTAL PRICE : ₺${(n * price).round()}');
  console.setForegroundColor(ConsoleColor.magenta);
  price = 0;
  n = 1.0;
  console.setForegroundColor(ConsoleColor.red);
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.8).round(), 0);
  console.write("<=== PRESS LEFT ARROW TO GO BACK");
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.8).round(),
      stdout.terminalColumns - "PRESS RIGHT ARROW TO GO PAYMENT ===>".length);
  console.write("PRESS RIGHT ARROW TO GO PAYMENT ===>");
//READS A KEY FROM THE KEYBOARD CLICKING
//IF THE KEY IS ENTER
  readKey = console.readKey();

  if (readKey.controlChar == ControlCharacter.arrowRight) {
    console.cursorPosition = Coordinate((stdout.terminalLines * 0.8).round(),
        stdout.terminalColumns - "PRESS RIGHT ARROW TO GO PAYMENT ===>".length);
    //WHEN CLICK COLOR CHANGING
    console.setForegroundColor(ConsoleColor.blue);
    console.write("PRESS RIGHT ARROW TO GO PAYMENT ===>");
    //THEN SETS THE FONT COLOUR BACK
    console.setForegroundColor(ConsoleColor.magenta);
    sleep(Duration(milliseconds: 0576));
    if (bLoginCheck == false) {
      console.cursorPosition = Coordinate(
          (stdout.terminalLines * 0.8).round(),
          (stdout.terminalColumns / 2).round() -
              'You should login for payment section'.length ~/ 2);
      console.writeErrorLine('You should login for payment section');
      sleep(Duration(seconds: 2));
      loginCheckBeforePayment = true;
      console.clearScreen();
      console.cursorPosition = Coordinate(
          (stdout.terminalLines * 0.5).round(),
          (stdout.terminalColumns / 2).round() -
              '<== To Sign Up Press Left Arrow'.length -
              20);
      console.write("<== To Sign Up Press Left Arrow");
      console.cursorPosition = Coordinate((stdout.terminalLines * 0.5).round(),
          (stdout.terminalColumns / 2).round() + 20);
      console.write("To Log In Press Right Arrow ==>");
      console.setForegroundColor(ConsoleColor.magenta);
      readKey = console.readKey();
      if (readKey.controlChar == ControlCharacter.arrowLeft) {
        console.cursorPosition = Coordinate(
            (stdout.terminalLines * 0.5).round(),
            (stdout.terminalColumns / 2).round() -
                '<== To Sign Up Press Left Arrow'.length -
                20);
        console.setForegroundColor(ConsoleColor.blue);
        console.write("<== To Sign Up Press Left Arrow");
        sleep(Duration(milliseconds: 567));
        console.setForegroundColor(ConsoleColor.magenta);

        return account();
      } else if (readKey.controlChar == ControlCharacter.arrowRight) {
        console.cursorPosition = Coordinate(
            (stdout.terminalLines * 0.5).round(),
            (stdout.terminalColumns / 2).round() + 20);
        console.setForegroundColor(ConsoleColor.blue);
        console.write("To Log In Press Right Arrow ==>");
        sleep(Duration(milliseconds: 567));
        console.setForegroundColor(ConsoleColor.magenta);
        return login();
      } else {
        return hotelInfo();
      }
    }
    // RETURNS TO THE PAYMENT
    return payment();
  } else if (readKey.controlChar == ControlCharacter.arrowLeft) {
    console.cursorPosition =
        Coordinate((stdout.terminalLines * 0.8).round(), 0);
//WHEN CLICK COLOR CHANGING
    console.setForegroundColor(ConsoleColor.blue);

    console.write("<=== PRESS LEFT ARROW TO GO BACK");
    //THEN SETS THE FONT COLOUR BACK
    console.setForegroundColor(ConsoleColor.magenta);
    sleep(Duration(milliseconds: 0576));
    return country();
  } else {
    console.setForegroundColor(ConsoleColor.magenta);

    return hotelInfo();
  }
}
