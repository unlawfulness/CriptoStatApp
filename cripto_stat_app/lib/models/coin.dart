class Coin {
  String id;
  String symbol;
  String name;

  Coin({required this.id, required this.name, required this.symbol});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'], 
      name: json['name'], 
      symbol: json['symbol']);
  }
}
