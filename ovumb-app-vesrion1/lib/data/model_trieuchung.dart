class DataTrieuChung {
  final String title;
  final List<String> image;
  final List<String> text;
  final List<bool> isClick;

  DataTrieuChung(
    this.title,
    this.image,
    this.text,
    this.isClick,
  );
}

class IsCheck {
   bool isClickCheckbox;

  IsCheck(
    this.isClickCheckbox,
  );
}

List<IsCheck> ischeck = [
  IsCheck(false),
];
