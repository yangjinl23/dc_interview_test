import 'package:logger/logger.dart';

var HiLog = Logger(
  printer: PrettyPrinter(
    printEmojis: false,
    printTime: true,
  ),
);