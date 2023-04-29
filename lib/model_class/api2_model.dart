class CurrencyAll {
  final String code;
  final double value;

  CurrencyAll({
    required this.code,
    required this.value,
  });

  factory CurrencyAll.fromMap({required Map dataall}) {
    return CurrencyAll(
      code: dataall["code"],
      value: double.parse(dataall['value'].toString()),
    );
  }
}
