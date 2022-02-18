import 'dart:convert';
import 'package:cripto_stat_app/feature/data/models/hero_coin.dart';
import 'package:http/http.dart' as http;

class HeroCoinProvider {
  //https://api.coingecko.com/api/v3/coins/01coin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false

  Future<List<HeroCoin>> getCoin(String id) async {
    final url = Uri(
        host:
            'https://api.coingecko.com/api/v3/coins/$id?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> heroCoinJson = json.decode(response.body);
      return heroCoinJson.map((json) => HeroCoin.fromJson(json)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
