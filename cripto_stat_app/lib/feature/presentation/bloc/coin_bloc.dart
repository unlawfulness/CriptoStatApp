
import 'package:cripto_stat_app/services/coin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'coin_event.dart';
import 'coin_state.dart';
import '../../data/models/coin_model.dart';


class CoinBloc extends Bloc<CoinEvent, CoinSearchState>{
  CoinRepository coinRepository;
  CoinBloc(this.coinRepository) : super(CoinEmptyState());
  @override
  Stream<CoinSearchState> mapEventToState(CoinEvent event) async*{
    if (event is CloinLoadEvent){
      yield CoinLoadingState();
      try {
        final List<CoinModel> _loadedCoinList = await coinRepository.getAllCoins();  
        yield CoinLoadedState(loadedCoin: _loadedCoinList);
      } catch (_) {
        yield CoinEmptyState();
      }
    }
  }
  

}