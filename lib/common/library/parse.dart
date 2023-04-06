String decodeString(String u) {
  List<String> tArr = u.split("*");
  StringBuffer str = StringBuffer();
  for (var i = 0; i < tArr.length; i++) {
    int n = int.parse(tArr[i]);
    str.writeCharCode(n);
  }
  return str.toString();
}