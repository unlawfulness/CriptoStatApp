// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable {
  String id;
  String rank;
  String symbol;
  String name;
  String supply;
  String maxSupply;
  String marketCapUsd;
  String volumeUsd24Hr;
  String priceUsd;
  String changePercent24Hr;
  String vwap24Hr;

  CoinEntity({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vwap24Hr,
  });
 
  @override
  List<Object> get props {
    return [
      id,
      rank,
      symbol,
      name,
      supply,
      maxSupply,
      marketCapUsd,
      volumeUsd24Hr,
      priceUsd,
      changePercent24Hr,
      vwap24Hr,
    ];
  }
}


