// ignore_for_file: avoid_print

import 'dart:math';

Future<void> simulateWait(String desc) async {
  print('waiting on $desc repository...');
  await Future.delayed(Duration(milliseconds: Random().nextInt(10)));
  print('done $desc');
}
