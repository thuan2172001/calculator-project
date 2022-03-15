String formatDisplay(String value) {
  String formatted = '';

  for (var i = 0; i < value.length; i++) {
    formatted += value[i];
    if ((value.length - (i + 1)) % 3 == 0 && (i + 1) != value.length) formatted += ',';
  }

  return formatted;
}

String clear(double result) {
  String cleaned = '';

  if (result == result.round()) {
    cleaned = result.round().toString();
    cleaned = formatDisplay(cleaned);
  } else {
    cleaned = result.toStringAsFixed(4).replaceAll(RegExp(r'0+$'), '');
    List<String> list = cleaned.split('.');
    cleaned = formatDisplay(list[0]) + '.' + list[1];
  }

  return cleaned;
}
