import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/coin.dart';

class CoinFromJson{
  //https://api.coingecko.com/api/v3/coins/01coin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false

  Future<List<Coin>> getCoin() async {
    var data = await rootBundle.loadString('assets/json/allcoins.json');
    var my_data = json.decode(data);

    return my_data.map<Coin>(Coin.fromJson).toList();
  }

}