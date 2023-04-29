class Currency {
  final double result;
  final double rate;
  final String from;

  Currency({
    required this.result,
    required this.rate,
    required this.from,
  });

  factory Currency.fromMap({required Map<String, dynamic> data}) {
    return Currency(
      result: data["result"],
      rate: data["info"]["rate"],
      from: data["query"]["from"],
    );
  }
}
