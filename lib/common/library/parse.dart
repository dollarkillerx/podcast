String decodeString(String u) {
  List<String> tArr = u.split("*");
  StringBuffer str = StringBuffer();
  for (var i = 0; i < tArr.length; i++) {
    int n = int.parse(tArr[i]);
    str.writeCharCode(n);
  }
  return str.toString();
}

String formatNum(int num) {
  if (num < 1000) {
    return num.toString();
  } else if (num >= 1000 && num < 10000) {
    return '${(num / 1000).toStringAsFixed(2)}千';
  } else if (num >= 10000 && num < 100000) {
    return '${(num / 10000).toStringAsFixed(2)}万';
  } else if (num >= 100000 && num < 1000000) {
    return '${(num / 100000).toStringAsFixed(2)}十万';
  } else if (num >= 1000000 && num < 10000000) {
    return '${(num / 1000000).toStringAsFixed(2)}百万';
  } else if (num >= 10000000 && num < 100000000) {
    return '${(num / 10000000).toStringAsFixed(2)}千万';
  } else {
    return '${(num / 100000000).toStringAsFixed(2)}亿';
  }
}
