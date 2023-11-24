class DataShipping {
  bool isDeleted;
  bool isSelectedAdress;
  String option;

  DataShipping(
    this.isDeleted,
    this.isSelectedAdress,
    this.option,
  );
}

List<DataShipping> dataShipping = [
  DataShipping(false, false, 'Uyen Uyen'),
  DataShipping(false, false, 'Minh Minh'),
];
