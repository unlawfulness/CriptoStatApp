abstract class CoinSearchState{}

class CoinEmptyState extends CoinSearchState{}

class CoinLoadingState extends CoinSearchState{}

class CoinLoadedState extends CoinSearchState{
  List<dynamic> loadedCoin;
  CoinLoadedState({required this.loadedCoin}) : assert(loadedCoin!=null);
}

class CoinErrorState extends CoinSearchState{}