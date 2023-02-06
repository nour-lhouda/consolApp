import 'package:groupProject/functions/countries.dart';
import 'package:groupProject/functions/mainMenu.dart';
import 'package:groupProject/functions/welcomeExit.dart';
import 'login.dart';
import 'package:groupProject/functions/calendar.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/rooms.dart';
import 'package:groupProject/functions/guests.dart';
import 'package:groupProject/cities.dart';
import 'package:groupProject/functions/countryFunc.dart';
import 'package:groupProject/functions/login.dart';
import 'package:groupProject/functions/hotelinfo.dart';

final console = Console();
File fileReservation = File("Info/info.txt"); //OPENS FILE
List reservationList;
List reservationNameList = [
  "User ID:",
  "City:",
  "Hotel:",
  "Total Payment:",
  "Check In Date:",
  "Check Out Date:",
  "Number of Guests:",
  "Number of Rooms:",
];
//This function printing reservation information to screen after user paid successfully.
void reservationInfo() {
  console.clearScreen();
//It writes the hotel informations into Info.txt file.
  fileReservation.writeAsStringSync(
      '$id|${cities[countryIndex][city][lineNumber]["hotelName"]}|${(n * secondPrice).round()}|$dayCheckIn|$monthCheckIn|$yearCheckIn|$dayCheckOut|$monthCheckOut|$yearCheckOut|$adult|$child|$room|${listCities[cityNumbers - 1].toUpperCase()}\n',
      mode: FileMode.append);
  reservationList = fileReservation.readAsLinesSync().last.split('|');
  console.clearScreen();
  console.cursorPosition = Coordinate(2, 0);
  console.setForegroundColor(ConsoleColor.blue);
  console.writeLine('Book Information', TextAlignment.center);
  console.writeLine('${reservationNameList[0]}  ${reservationList[0]}');
  console.setForegroundColor(ConsoleColor.red);
  console.writeLine('${reservationNameList[1]}  ${reservationList[12]}');
  console.writeLine('${reservationNameList[2]}  ${reservationList[1]}');
  console.setForegroundColor(ConsoleColor.blue);

  console.writeLine('${reservationNameList[3]}  ₺${reservationList[2]}');
  console.writeLine(
      '${reservationNameList[4]}  ${reservationList[3]} / ${reservationList[4]} / ${reservationList[5]}');
  console.writeLine(
      '${reservationNameList[5]}  ${reservationList[6]} / ${reservationList[7]} / ${reservationList[8]}');
  console.writeLine(
      '${reservationNameList[6]}  ${reservationList[9]} Adult, ${reservationList[10]} Child');
  console.writeLine('${reservationNameList[7]}  ${reservationList[11]}');
  console.setForegroundColor(ConsoleColor.red);
  console.cursorPosition = Coordinate(stdout.terminalLines - 15, 0);
  console.write("PRESS ANY KEY TO RETURN MAIN MENU");
  console.cursorPosition = Coordinate(stdout.terminalLines - 11, 0);

  console.write("PRESS ESC TO EXIT");
//Reads the key for exit or return main menu
  Key decision = console.readKey();
  if (decision.controlChar == ControlCharacter.unknown) {
    console.cursorPosition = Coordinate(stdout.terminalLines - 11, 0);
    console.setForegroundColor(ConsoleColor.blue);
    console.write("PRESS ESC TO EXIT");
    sleep(Duration(milliseconds: 576));
    console.setForegroundColor(ConsoleColor.magenta);

    exitApplication();
  } else {
    return menu();
  }
}
