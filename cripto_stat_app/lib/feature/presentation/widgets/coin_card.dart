import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:cripto_stat_app/feature/presentation/pages/coin_detail_screen.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final CoinEntity coin;

  double getNumber(String input, {int precision = 2}) => double.parse(
      '$input'.substring(0, '$input'.indexOf('.') + precision + 1));

  const CoinCard({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color changeColor =
        (double.parse(coin.changePercent24Hr) > 0) ? Colors.green : Colors.red;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CoinDetailPage(coin: coin))),
      child: Card(
          margin: const EdgeInsets.all(5),
          elevation: 1,
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Text(
                coin.rank,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coin.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.left),
                  Text(coin.symbol,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.left)
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Text('\$${getNumber(coin.priceUsd, precision: 2)}',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.left)),
            Expanded(
                flex: 1,
                child: Text('${getNumber(coin.changePercent24Hr, precision: 2)}%',
                    style: TextStyle(fontSize: 16, color: changeColor),
                    textAlign: TextAlign.left)),
          ])),
    );
  }
}
