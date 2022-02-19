import 'package:cripto_stat_app/core/error/exception.dart';
import 'package:cripto_stat_app/feature/data/models/coin_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CoinRemoteDataSource {
  Future<List<CoinModel>> getAllCoins(int page);
  Future<List<CoinModel>> searchCoin(String query);
}

class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CoinModel>> getAllCoins(int page) async {
    var limit = 20;
    var offset = page * limit;
    return _getCoinFromUrl('https://api.coincap.io/v2/assets?limit=$limit&offset=$offset');
  }

  @override
  Future<List<CoinModel>> searchCoin(String query) async => _getCoinFromUrl('https://api.coincap.io/v2/assets?search=$query');

  Future<List<CoinModel>> _getCoinFromUrl(String url) async{
    final http.Client client;

    final responce = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'});
    if (responce.statusCode == 200) {
      final coins = json.decode(responce.body);
      return (coins['data'] as List)
          .map((coin) => CoinModel.fromJson(coin))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
