import 'dart:io';

String jsonFileReader(String file) =>
    File("test/json/$file").readAsStringSync();
