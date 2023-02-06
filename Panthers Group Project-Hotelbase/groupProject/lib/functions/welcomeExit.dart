import 'dart:io';
import 'package:dart_console/dart_console.dart';
import 'dart:math';
import 'mainMenu.dart';

final row = (console.windowHeight / 2).round() - 1;
final progressBarWidth = max(console.windowWidth - 10, 10);

List<Function> demoScreens = <Function>[
  (() {
    console.setBackgroundColor(ConsoleColor.white);
    console.setForegroundColor(ConsoleColor.blue);
    console.clearScreen();

    console.cursorPosition = Coordinate(row + 4, 0);

    console.writeLine(' H O T E L B A S E ', TextAlignment.center);
    console.cursorPosition = Coordinate(row - 4, 0);
    console.writeLine('L O A D I N G ...', TextAlignment.center);

    console.hideCursor();

    for (var i = 0; i <= 50; i++) {
      console.setForegroundColor(ConsoleColor.blue);
      console.cursorPosition = Coordinate(row, 4);
      final progress = (i / 50 * progressBarWidth).ceil();
      final bar = '[${'&' * progress}${' ' * (progressBarWidth - progress)}]';
      console.write(bar);
      sleep(const Duration(milliseconds: 40));
    }

    console.cursorPosition = Coordinate(console.windowHeight - 3, 0);
  }),
];

int animationScreen() {
  for (final demo in demoScreens) {
    console.clearScreen();
    demo();
    console.writeLine();
    menu();
  }

  return 0;
}

void exitApplication() {
  console.clearScreen();
  console.setForegroundColor(ConsoleColor.blue);
  console.cursorPosition = Coordinate(row + -3, 0);

  console.writeLine("THANKS FOR USING THE APP", TextAlignment.center);

  for (var i = 0; i <= 50; i++) {
    console.cursorPosition = Coordinate(row, 4);
    final progress = (i / 50 * progressBarWidth).ceil();
    final bar = '[${'&' * progress}${' ' * (progressBarWidth - progress)}]';
    console.write(bar);
    sleep(const Duration(milliseconds: 40));
  }
  exit(0);
}
