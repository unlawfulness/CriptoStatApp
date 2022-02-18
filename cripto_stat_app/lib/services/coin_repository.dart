import 'package:cripto_stat_app/feature/data/models/coin_model.dart';
import 'package:cripto_stat_app/services/coin_from_json.dart';

class CoinRepository{
  CoinFromJson _coinFromJson = CoinFromJson();
  Future<List<CoinModel>> getAllCoins() => _coinFromJson.getCoin();
}