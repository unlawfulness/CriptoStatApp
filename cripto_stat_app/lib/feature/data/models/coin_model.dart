import 'dart:convert';

import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';

class CoinModel extends CoinEntity {
  CoinModel(
      {required String id,
      required String symbol,
      required String name,
      required String supply,
      required String maxSupply,
      required String marketCapUsd,
      required String volumeUsd24Hr,
      required String priceUsd,
      required String changePercent24Hr,
      required String vwap24Hr})
      : super(
            id: id,
            symbol: symbol,
            name: name,
            supply: supply,
            maxSupply: maxSupply,
            marketCapUsd: marketCapUsd,
            volumeUsd24Hr: volumeUsd24Hr,
            priceUsd: priceUsd,
            changePercent24Hr: changePercent24Hr,
            vwap24Hr: vwap24Hr);

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        supply: json['supply'],
        maxSupply: json['maxSupply'],
        marketCapUsd: json['marketCapUsd'],
        volumeUsd24Hr: json['volumeUsd24Hr'],
        priceUsd: json['priceUsd'],
        changePercent24Hr: json['changePercent24Hr'],
        vwap24Hr: json['vwap24Hr']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'supply': supply,
      'maxSupply': maxSupply,
      'marketCapUsd': marketCapUsd,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'changePercent24Hr': changePercent24Hr,
      'vwap24Hr': vwap24Hr
    };
  }
}
