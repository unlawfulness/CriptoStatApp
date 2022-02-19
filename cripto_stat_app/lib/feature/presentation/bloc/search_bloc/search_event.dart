import 'package:equatable/equatable.dart';

abstract class CoinsSearchEvent extends Equatable{
  const CoinsSearchEvent();

}

class SearchCoins extends CoinsSearchEvent{
  final String personQuery;

  SearchCoins(this.personQuery);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}