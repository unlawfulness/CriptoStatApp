import 'package:cripto_stat_app/feature/data/models/coin_model.dart';
import 'package:cripto_stat_app/feature/domain/usecases/get_all_coins.dart';
import 'package:cripto_stat_app/feature/domain/usecases/search_coin.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CoinRemoutDataSource {
  Future<List<CoinModel>> getAllCoins(int page);
  Future<List<CoinModel>> searchCoin(String query);
}

class CoinRemoutDataSourceImpl implements CoinRemoutDataSource{
  @override
  Future<List<CoinModel>> getAllCoins(int page) async {
    
    final http.Client client;
    var pageLen = 20;

    var data = await rootBundle.loadString('assets/json/allcoins.json');
    var my_data = json.decode(data);
    var len = (my_data as List<dynamic>).length; 
    List<dynamic>? myPage; 

    for (int i = page*pageLen; i <= page*pageLen + pageLen; i++){
      if (page*pageLen + pageLen < len){
        myPage!.add(my_data[i]);}
    }

    for (int i = 0 ; i < myPage!.length; i++){
      var responce = await client.get(Uri.parse('https://api.coingecko.com/api/v3/coins/$myPage[i]?tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false'))
    }

    throw UnimplementedError();
  }

  @override
  Future<List<CoinModel>> searchCoin(String query) {
    // TODO: implement searchCoin
    throw UnimplementedError();
  }

}