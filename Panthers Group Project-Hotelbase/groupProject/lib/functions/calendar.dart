import 'package:groupProject/functions/guests.dart';
import 'welcomeExit.dart';
import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'package:date_util/date_util.dart';

final console = Console();
var dateUtility = DateUtil();
//Date util library for actual dates
var now = DateTime.now();
var nowYear = DateTime.now().year;
var nowMonth = DateTime.now().month;
var nowDay = DateTime.now().day;

File file = File("functions/info.txt"); //IT OPENS FILE

int yearCheckIn;
int monthCheckIn;
int dayCheckIn;
int dayCheckOut;
int monthCheckOut;
int yearCheckOut;
int reservationDay;

//Calendar function for choosing dates
//We wanted calendar more dynamic and good looking  we designed a small menu type calendar you can use with Up and Down Arrow and Enter.
void calendar() {
  console.clearScreen();

  console.setForegroundColor(ConsoleColor.blue);
  console.cursorPosition = Coordinate((stdout.terminalLines * 0.3).round(), 0);
  console.writeLine("Check-in and check-out date", TextAlignment.center);
  console.setForegroundColor(ConsoleColor.cyan);
  console.cursorPosition = Coordinate(row - 1, 0);
  console.write("Choose the Date :");
  console.cursorPosition = Coordinate(row - 1, 18);
  console.write('yyyy / mm / dd');
  console.setForegroundColor(ConsoleColor.red);

  console.rawMode = true;
  console.cursorPosition = Coordinate(row, 0);
  console.write('Check In Date   : ');
  console.cursorPosition = Coordinate(row, 23);

  console.write('/');
//I USED AN DECREASING FOR LOOP TO MAKE THIS CALENDAR
  for (int i = nowYear; i > 2020; i--) {
    console.cursorPosition = Coordinate(row, 18);

    console.write("$i");
    Key keyz = console.readKey();

    if (keyz.controlChar == ControlCharacter.arrowDown) {
      if (i > 2021) {
        continue;
      } else {
        i++;
        continue;
      }
    } else if (keyz.controlChar == ControlCharacter.arrowUp) {
      if (i <= 2022) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      yearCheckIn = i;
      break;
    } else {
      print("\n\n\nSelect date");
      i++;
      continue;
    }
  }

  console.cursorPosition = Coordinate(row, 28);
  console.write("/");

  for (int i = nowMonth; i > 0; i--) {
    console.cursorPosition = Coordinate(row, 25);
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
      if (i <= 11) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      monthCheckIn = i;
      break;
    } else {
      print("\n\n\nSelect date");
      i++;
      continue;
    }
  }

  for (int i = nowDay; i > 0; i--) {
    console.cursorPosition = Coordinate(row, 30);

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
      if (i <= dateUtility.daysInMonth(monthCheckIn, yearCheckIn) - 1) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      dayCheckIn = i;
      break;
    } else {
      print("\n\n\nSelect date");
      i++;
      continue;
    }
  }

  console.setForegroundColor(ConsoleColor.cyan);

  console.setForegroundColor(ConsoleColor.red);

  console.rawMode = true;
  console.cursorPosition = Coordinate(row + 3, 0);
  console.write('Check Out Date  : ');
  console.cursorPosition = Coordinate(row + 3, 23);

  console.write("/");

  for (int i = nowYear; i > 2020; i--) {
    console.cursorPosition = Coordinate(row + 3, 18);

    console.write("$i");
    Key keyz = console.readKey();

    if (keyz.controlChar == ControlCharacter.arrowDown) {
      if (i > 2021) {
        continue;
      } else {
        i++;
        continue;
      }
    } else if (keyz.controlChar == ControlCharacter.arrowUp) {
      if (i <= 2022) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      yearCheckOut = i;
      break;
    } else {
      print("\n\n\nSelect date");
      i++;
      continue;
    }
  }

  console.cursorPosition = Coordinate(row + 3, 28);
  console.write("/");

  for (int i = nowMonth; i > 0; i--) {
    console.cursorPosition = Coordinate(row + 3, 25);
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
      if (i <= 11) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      monthCheckOut = i;
      break;
    } else {
      print("\n\n\nSelect date");
      i++;
      continue;
    }
  }

  for (int i = nowDay; i > 0; i--) {
    console.cursorPosition = Coordinate(row + 3, 30);

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
      if (i <= dateUtility.daysInMonth(monthCheckOut, yearCheckOut) - 1) {
        i += 2;
      } else {
        i++;
      }
    } else if (keyz.controlChar == ControlCharacter.enter) {
      dayCheckOut = i;
      break;
    } else {
      print("\n\n\nSelect date");
      i++;
      continue;
    }
  }

  while (yearCheckOut == yearCheckIn && monthCheckOut == monthCheckIn) {
    if (dayCheckOut - dayCheckIn <= 30) {
      console.clearScreen();
      reservationDay = dayCheckOut - dayCheckIn;
      if (reservationDay <= 0 || reservationDay > 30) {
        return calendar();
      }

      return guests();
    } else {
      return calendar();
    }
  }
  if (nowYear == yearCheckIn && nowMonth > monthCheckIn ||
      nowMonth > yearCheckOut) {
    return calendar();
  }
  if (nowYear <= yearCheckIn &&
      nowMonth <= yearCheckIn &&
      nowDay > dayCheckIn) {
    return calendar();
  }

  if (yearCheckOut - yearCheckIn < 0) {
    return calendar();
  }
  while (yearCheckOut == yearCheckIn) {
    if (monthCheckOut - monthCheckIn == 1) {
      reservationDay =
          dateUtility.daysInMonth(monthCheckIn, yearCheckIn) - dayCheckIn;
      reservationDay += dayCheckOut;
      if (reservationDay <= 0 || reservationDay > 30) {
        return calendar();
      }

      return guests();
    } else {
      return calendar();
    }
  }

  while (yearCheckOut - yearCheckIn == 1) {
    if (monthCheckOut - monthCheckIn == -11) {
      reservationDay = 31 - dayCheckIn;
      reservationDay += dayCheckOut;
      if (reservationDay <= 0 || reservationDay > 30) {
        return calendar();
      }
      return guests();
    } else {
      return calendar();
    }
  }
  if (yearCheckOut - yearCheckIn < 0) {
    return calendar();
  } else if (dayCheckOut - dayCheckIn <= 0 || dayCheckOut - dayCheckIn > 30) {
    return calendar();
  }
}
