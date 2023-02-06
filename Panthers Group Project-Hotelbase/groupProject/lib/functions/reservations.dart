import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/mainMenu.dart';
import 'package:groupProject/functions/reservationInfo.dart';
import 'package:groupProject/functions/login.dart';
import 'package:groupProject/functions/welcomeExit.dart';

final console = Console();
File fileReservation = File("Info/info.txt"); //OPENS FILE
int idCounter = 0;
//This function is accessed by pressing 5 from the main menu.
//This function prints the previously made successful reservations for the user name separately.

void reservations() {
  console.clearScreen();
  print("\n");
  console.setForegroundColor(ConsoleColor.blue);
  console.writeLine('YOUR RESERVATIONS', TextAlignment.center);
  console.setForegroundColor(ConsoleColor.magenta);
  print("\n\n");

  reservationList = [];
  //Reads from the txt
  for (var i = 0; i < fileReservation.readAsLinesSync().length; i++) {
    reservationList = fileReservation.readAsLinesSync()[i].split('|');
    if (reservationList[0] == id) {
      if (idCounter > 0) {
        console
            .writeLine('\n>-----------------------------------------------\n');
      }
      console.setForegroundColor(ConsoleColor.red);

      console.writeLine('${reservationNameList[0]}  ${reservationList[0]}');
      console.setForegroundColor(ConsoleColor.cyan);
      console.writeLine('${reservationNameList[1]}  ${reservationList[12]}');

      console.writeLine('${reservationNameList[2]}  ${reservationList[1]}');
      console.setForegroundColor(ConsoleColor.red);

      console.writeLine('${reservationNameList[3]}  ₺${reservationList[2]}');
      console.setForegroundColor(ConsoleColor.black);

      console.writeLine(
          '${reservationNameList[4]}  ${reservationList[3]} / ${reservationList[4]} / ${reservationList[5]}');
      console.writeLine(
          '${reservationNameList[5]}  ${reservationList[6]} / ${reservationList[7]} / ${reservationList[8]}');
      console.writeLine(
          '${reservationNameList[6]}  ${reservationList[9]} Adult, ${reservationList[10]} Child');
      console.writeLine('${reservationNameList[7]}  ${reservationList[11]}');
      idCounter++;
    }
    reservationList = [];
  }
  console.setForegroundColor(ConsoleColor.blue);
  console.write("\n\nPRESS");
  console.setForegroundColor(ConsoleColor.red);
  console.write("'ANY KEY' ");
  console.setForegroundColor(ConsoleColor.blue);
  console.write("TO  RETURN MAIN MENU\n");

  console.write("PRESS");
  console.setForegroundColor(ConsoleColor.red);
  console.write("'ESC' ");
  console.setForegroundColor(ConsoleColor.blue);

  console.write("TO  EXIT");
  Key wait = console.readKey();
  if (wait.controlChar == ControlCharacter.unknown) {
    exitApplication();
  } else {
    return menu();
  }
}
