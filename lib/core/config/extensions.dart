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