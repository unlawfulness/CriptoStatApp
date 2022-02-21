import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:flutter/material.dart';

class CoinDetailPage extends StatelessWidget {
  final CoinEntity coin;

  const CoinDetailPage({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(coin.name), Text(coin.symbol)],
            )),
        Expanded(
            flex: 4,
            child: Column(
              children: [Text(coin.priceUsd), Text(coin.changePercent24Hr)],
            ))
      ],
    ));
  }
}
