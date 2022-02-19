import 'dart:convert';

import 'package:cripto_stat_app/core/error/exception.dart';
import 'package:cripto_stat_app/feature/data/models/coin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CoinLocalDataSource {
  Future<List<CoinModel>> getLastCoinsFromCache();
  Future<void> coinsToCache(List<CoinModel> coins);
}

const CACHED_COINS_LIST = 'CACHED_COINS_LIST';

class CoinLocalDataSourceImpl implements CoinLocalDataSource {
  final SharedPreferences sharedPreferences;

  CoinLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CoinModel>> getLastCoinsFromCache() {
    final jsonCoinsList = sharedPreferences.getStringList(CACHED_COINS_LIST);
    if (jsonCoinsList!.isNotEmpty) {
      return Future.value(jsonCoinsList
          .map((coin) => CoinModel.fromJson(json.decode(coin)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> coinsToCache(List<CoinModel> coins) {
    final List<String> jsonCoinsList =
        coins.map((coin) => json.encode(coin.toJson())).toList();

    sharedPreferences.setStringList(CACHED_COINS_LIST, jsonCoinsList);
    print('Coins to write Cache: ${jsonCoinsList.length}');
    return Future.value(jsonCoinsList);
  }
}
