class HeroCoin {
  String id;
  String symbol;
  String name;

  HeroCoin({required this.id, required this.name, required this.symbol});

  factory HeroCoin.fromJson(Map<String, dynamic> json) {
    return HeroCoin(
      id: json['id'], 
      name: json['name'], 
      symbol: json['symbol']);
  }
}
