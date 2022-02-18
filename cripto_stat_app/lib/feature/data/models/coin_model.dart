import 'package:cripto_stat_app/feature/data/models/link_midel.dart';
import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';

class CoinModel extends CoinEntity {
  CoinModel({
    required id,
    required symbol,
    required name,
    required hashing_algorithm,
    required image,
    required links,
  }) : super(
            id: id,
            symbol: symbol,
            name: name,
            hashing_algorithm: hashing_algorithm,
            image: image,
            links: links);

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
        id: json['id'],
        name: json['name'],
        symbol: json['symbol'],
        hashing_algorithm: json[''],
        image: json['image']['small'],
        links: json['links'] != null ? LinksModel.fromJson(json['links']) : null);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'hashing_algorithm': hashing_algorithm,
      'image': image,
      'links': links
    };
  }
}
