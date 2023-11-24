class NumberHandle {
  //format gia tien
  String formatPrice(num price, String type, String unit) {
    String value = price.toInt().toString();
    int count = 0;
    String tmp = '';
    if (value.length > 1) {
      for (int i = value.length - 1; i >= 0; i--) {
        tmp += value[i];
        count++;
        if (count % 3 == 0 && count != value.length) {
          tmp += type;
        }
      }
      return tmp.split('').reversed.join() + unit;
    }
    return value + unit;
  }
}
