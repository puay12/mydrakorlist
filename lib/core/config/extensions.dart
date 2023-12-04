import 'dart:math';

bool toBoolean(String string) {
  return (string.toLowerCase() == "true" || string.toLowerCase() == "1")
      ? true
      : (string.toLowerCase() == "false" || string.toLowerCase() == "0")
      ? false
      : true;
}

String boolToString(bool val) {
  return val == true
    ? "true"
    : "false";
}

String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  return String.fromCharCodes(
      Iterable.generate(len, (_) => _chars.codeUnitAt(r.nextInt(_chars.length))));
}