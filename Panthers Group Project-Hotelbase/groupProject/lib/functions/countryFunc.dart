import 'package:groupProject/functions/countries.dart';
import 'package:groupProject/functions/hotelinfo.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:groupProject/cities.dart';

final console = Console();
File file = File("Accounts/Accounts.txt"); //OPENS FILE
int starIndex = 1;
int mapKeyIndex = 1;
String star = '==>';
var city;
var lineNumber;
int cityNumbers;
List listCities;

void country() {
  //USING TRY CATH BECAUSE OF AVOIDING INVALID RANGE EXCEPTIONS FOR MAPS
  try {
    console.setForegroundColor(ConsoleColor.red);
    console.clearScreen();
//TAKES TO CITIES KEY INDEX TO A LIST
    listCities = cities[countryIndex].keys.toList();
    console.cursorPosition = Coordinate(3, 0);
//TO PRINT ALL CITY NAMES AND ORDER
    for (int i = 0; i < cities[countryIndex].length; i++) {
      print('${i + 1}) ${listCities[i].toUpperCase()}');
    }
    console.cursorPosition = Coordinate(0, 0);
    console.setForegroundColor(ConsoleColor.blue);
    console.showCursor();
    //TAKES THE INTEGER INPUT TO MATCH WITH MAP KEY
    console.write("Enter a number to get in the city: ");
    cityNumbers = int.parse(console.readLine());
    console.cursorPosition = Coordinate(3, 0);
    console.hideCursor();
    console.setForegroundColor(ConsoleColor.red);

    //
    city = listCities[cityNumbers - 1];

    console.clearScreen();
    console.cursorPosition = Coordinate(starIndex + 1, 0);
    console.setForegroundColor(ConsoleColor.blue);
    console.write(star);
    console.setForegroundColor(ConsoleColor.magenta);

    lineNumber = 1;
    if (cities[countryIndex].containsKey(city)) {
      /*MENU FOR HOTEL NAMES USING WITH UP, DOWN ARROWS
    AND ENTER TO GO INSIDE OF THE HOTEL.IT PRINTS ALL THE HOTELS
    IN COUNTRY/CITY YOU HAVE CHOSEN BEFORE WITH AN ARROW CURSOR, ARROW MOVES
    AND THE CURRENT LINE IS CHANGING THE COLOUR.
    */
      while (true) {
        for (var j = 1; j <= cities[countryIndex][city].length; j++) {
          //PRINTS THE HOTEL NAME TO SHOW IN HOTELS MENU AS A TITLE
          console.cursorPosition = Coordinate(
              0,
              stdout.terminalColumns ~/ 2 -
                  "***HOTELS OF ${listCities[cityNumbers - 1].toUpperCase()}***"
                          .length ~/
                      2);
          console.setForegroundColor(ConsoleColor.cyan);
          console.write(
              "***HOTELS OF ${listCities[cityNumbers - 1].toUpperCase()}***");
          console.setForegroundColor(ConsoleColor.red);

          console.cursorPosition = Coordinate(starIndex + j, 6);
          //IF FOR LOOP VARIABLE EQUALS TO LINE NUMBER
          //PRINT THE LINE NUMBER WITH DIFFERENT COLOUR THAN OTHER LINES
          if (j == lineNumber) {
            console.setForegroundColor(ConsoleColor.blue);
            console.writeLine(cities[countryIndex][city][j]['hotelName']);
            console.setForegroundColor(ConsoleColor.magenta);
          } else {
            console.writeLine(cities[countryIndex][city][j]['hotelName']);
          }
        }
        //READ THE KEY FROM STDIN
        Key key = console.readKey();
        //IF THE KEY EQUALS DOWN ARROW CONTROL CHARACTER
        if (key.controlChar == ControlCharacter.arrowDown) {
          console.clearScreen();
          //INCREASE THE LINE NUMBER
          lineNumber++;
          //IF LINE NUMBER LARGER THAN CITY MAP LENGTH MAKE IT EQUALS TO CITY MAP LENGTH
          //THAT IS LIMITING THE MENU (BOUNDARIES OF THE MENU).
          if (lineNumber > cities[countryIndex][city].length) {
            lineNumber = cities[countryIndex][city].length;
          }
          console.cursorPosition = Coordinate(starIndex + lineNumber, 0);
          console.setForegroundColor(ConsoleColor.blue);
          //PRINTS THE ARROW
          console.write(star);
          console.setForegroundColor(ConsoleColor.magenta);
          //IF THE KEY EQUALS UP ARROW CONTROL CHARACTER
        } else if (key.controlChar == ControlCharacter.arrowUp) {
          console.clearScreen();
          // DECREASE THE LINE NUMBER
          lineNumber--;
          //IF LINE NUMBER SMALLER THAN "1"(MAPS STARTING INDEX) MAKE IT EQUALS TO "1"
          //THAT IS LIMITING THE MENU (BOUNDARIES OF THE MENU).
          if (lineNumber < 1) {
            lineNumber = 1;
          }
          console.cursorPosition = Coordinate(starIndex + lineNumber, 0);
          console.setForegroundColor(ConsoleColor.blue);
          console.write(star);
          console.setForegroundColor(ConsoleColor.magenta);
          //IF KEY EQUALS TO THE ENTER CONTROL CHARACTER
        } else if (key.controlChar == ControlCharacter.enter) {
          //CALL THE hotelInfo FUNCTION WITH CITY INDEX AND LINE NUMBER
          return hotelInfo();
        }
      }
    }
  }
  //WHEN IT IS CATCHING CALL THE SAME FUNCTION TO TAKE INPUT AGAIN FROM START
  catch (e) {
    console.cursorPosition = Coordinate(stdout.terminalLines, 0);
    console.setForegroundColor(ConsoleColor.red);
    //PRINTS THE ERROR MESSAGE
    console.writeLine("YOUR WRONG INPUT PLEASE TRY AGAIN!!!!!!");
    sleep(Duration(milliseconds: 576));
    return country();
  }
}
