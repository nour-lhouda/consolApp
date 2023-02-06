import 'package:dart_console/dart_console.dart';
import 'package:groupProject/functions/hotelinfo.dart';
import 'package:groupProject/functions/reservationInfo.dart';

final console = Console();

String cardName, cardSurname, cardNum, secNum;
int expYear,
    expMonth,
    systemYear = DateTime.now().year,
    systemMonth = DateTime.now().month;
bool bInformation = false;
var check = RegExp(r'^[^<\d*+@><\-\+"%\/\[\]>\(\)}\{\\\$#£!||_~\.\:\^]+$');

void payment() {
  console.clearScreen();
  console.setForegroundColor(ConsoleColor.magenta);
  print("\n\n");
  console.setForegroundColor(ConsoleColor.blue);
  console.writeLine("***PAYMENT SECTION***", TextAlignment.center);
  console.setForegroundColor(ConsoleColor.magenta);

  print("\n\n\n");
  // Getting Card Holder Name and Surename and checking them
  console.write('Please Enter the Card Holder Name:');
  while (true) {
    console.setForegroundColor(ConsoleColor.blue);
    console.cursorPosition = Coordinate(8, 35);

    cardName = console.readLine();
    console.setForegroundColor(ConsoleColor.magenta);

    if (check.hasMatch(cardName) == false ||
        cardName.length > 25 ||
        cardName == "") {
      bInformation = true;
      if (bInformation == true) {
        console.setForegroundColor((ConsoleColor.red));
        console.cursorPosition = Coordinate(8, 94);
        console.write("***INVALID CARD HOLDER NAME!***");
        console.setForegroundColor(ConsoleColor.magenta);
      }
      console.cursorPosition = Coordinate(8, 35);
    } else {
      break;
    }
  }
  print("\n");
  console.write('Please Enter the Card Holder Surname:');

  while (true) {
    console.cursorPosition = Coordinate(11, 38);
    console.setForegroundColor(ConsoleColor.blue);

    cardSurname = console.readLine();
    console.setForegroundColor(ConsoleColor.magenta);

    if (check.hasMatch(cardSurname) == false ||
        cardSurname.length > 25 ||
        cardSurname == "") {
      bInformation = true;
      if (bInformation == true) {
        console.cursorPosition = Coordinate(11, 94);
        console.setForegroundColor(ConsoleColor.red);
        console.writeLine("***INVALID CARD HOLDER SURNAME!***");
        console.setForegroundColor(ConsoleColor.magenta);
      }
      console.cursorPosition = Coordinate(11, 38);
    } else {
      break;
    }
  }
  bInformation = false;

  // Getting Card Number and checking it
  print("\n");
  console.write('Please Enter the Card Number:');

  while (true) {
    console.setForegroundColor(ConsoleColor.blue);
    console.cursorPosition = Coordinate(14, 30);

    cardNum = console.readLine();
    console.setForegroundColor(ConsoleColor.magenta);

    var check =
        RegExp(r'^[^<A-Za-z*+@><\-\+"%\/\[\]>\(\)}\{\\\$#£!||_~\.\:\^ 	]+$');
    if (check.hasMatch(cardNum) == false ||
        cardNum.length < 16 ||
        cardNum.length > 16) {
      //number is ok

      bInformation = true;
      if (bInformation == true) {
        console.cursorPosition = Coordinate(14, 96);
        console.setForegroundColor(ConsoleColor.red);
        console.writeLine("***INVALID CARD NUMBER!***");
        console.setForegroundColor(ConsoleColor.magenta);

        console.cursorPosition = Coordinate(14, 30);
      }
      console.cursorPosition = Coordinate(2, 29);
    } else {
      break;
    }
  }

  bInformation = false;
// Getting Expiration Year and Month and Checking it
  console.setForegroundColor(ConsoleColor.magenta);

  bInformation = false;
  print("\n");
  console.write('Please Enter The Card Expiration Year :');
  bool bIsYearEqual = false;
  while (true) {
    console.cursorPosition = Coordinate(17, 40);
    console.setForegroundColor(ConsoleColor.blue);
    expYear = int.tryParse(console.readLine());
    console.setForegroundColor(ConsoleColor.magenta);
    if (expYear == systemYear) {
      bIsYearEqual = true;
    }

    if (expYear == null ||
        expYear < systemYear ||
        expYear > systemYear + 115 ||
        expYear < systemYear - 115) {
      bInformation = true;

      if (bInformation == true) {
        console.cursorPosition = Coordinate(17, 100);
        console.setForegroundColor(ConsoleColor.red);
        console.writeLine("***INVALID YEAR!***");
        console.setForegroundColor(ConsoleColor.magenta);

        console.cursorPosition = Coordinate(17, 40);
      }
      console.cursorPosition = Coordinate(18, 40);
    } else {
      break;
    }
  }

  bInformation = false;

  print("\n");
  console.write('Please Enter The Card Expiration Month:');

  while (true) {
    console.cursorPosition = Coordinate(20, 40);
    console.setForegroundColor(ConsoleColor.blue);
    expMonth = int.tryParse(console.readLine());
    if (bIsYearEqual == true && expMonth != null) {
      if (systemMonth > expMonth) {
        bInformation = true;
      } else {
        bInformation = false;
      }
    }
    if (bInformation == true ||
        expMonth == null ||
        expMonth < 1 ||
        expMonth > 12 ||
        expMonth == '') {
      bInformation == true;

      console.cursorPosition = Coordinate(20, 100);
      console.setForegroundColor(ConsoleColor.red);
      console.writeLine("***INVALID MONTH!***");
      console.setForegroundColor(ConsoleColor.magenta);

      console.cursorPosition = Coordinate(20, 40);
    } else {
      break;
    }
  }
  console.setForegroundColor(ConsoleColor.magenta);
  bInformation = false;

  //Getting Cvv2 and Checking it
  print("\n");
  console.write('Please Enter The Card Cvv2:');
  while (true) {
    console.cursorPosition = Coordinate(23, 28);
    console.setForegroundColor(ConsoleColor.blue);

    secNum = console.readLine();
    console.setForegroundColor(ConsoleColor.magenta);

    var check = RegExp('[0-9]');
    if (secNum == '' ||
        secNum.length < 3 ||
        secNum.length > 3 ||
        check.hasMatch(secNum) == false) {
      bInformation = true;
      if (bInformation == true) {
        console.cursorPosition = Coordinate(23, 100);
        console.setForegroundColor(ConsoleColor.red);

        console.writeLine("***INVALID CVV2!***");

        console.setForegroundColor(ConsoleColor.magenta);

        console.cursorPosition = Coordinate(23, 28);
      }
      console.cursorPosition = Coordinate(23, 28);
    } else {
      break;
    }
  }
  loginCheckBeforePayment = false;
  reservationInfo();
}
