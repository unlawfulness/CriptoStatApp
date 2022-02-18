
import 'package:cripto_stat_app/services/coin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coin_event.dart';
import 'coin_state.dart';
import '../../data/models/coin.dart';


class CoinBloc extends Bloc<CoinEvent, CoinState>{
  CoinRepository coinRepository;
  CoinBloc(this.coinRepository) : super(CoinEmptyState());
  @override
  Stream<CoinState> mapEventToState(CoinEvent event) async*{
    if (event is CloinLoadEvent){
      yield CoinLoadingState();
      try {
        final List<Coin> _loadedCoinList = await coinRepository.getAllCoins();  
        yield CoinLoadedState(loadedCoin: _loadedCoinList);
      } catch (_) {
        yield CoinEmptyState();
      }
    }
  }
  

}