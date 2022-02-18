abstract class CoinState{}

class CoinEmptyState extends CoinState{}

class CoinLoadingState extends CoinState{}

class CoinLoadedState extends CoinState{
  List<dynamic> loadedCoin;
  CoinLoadedState({required this.loadedCoin}) : assert(loadedCoin!=null);
}

class CoinErrorState extends CoinState{}