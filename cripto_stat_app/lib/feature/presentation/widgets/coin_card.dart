import 'package:cripto_stat_app/common/app_colors.dart';
import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final CoinEntity coin;

  const CoinCard({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color changeColor =
        (double.parse(coin.changePercent24Hr) > 0) ? Colors.green : Colors.red;
    return Container(
        decoration: BoxDecoration(
            color: AppColors.cellBacground,
            borderRadius: BorderRadius.circular(8)
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 3),
            Flexible(
              flex: 1,
              child: Container(
                  child: Text(
                coin.rank,
                style: TextStyle(fontSize: 17, color: Colors.black),
              )),
            ),
            Flexible(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(coin.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text(coin.symbol,
                          style: TextStyle(fontSize: 14, color: Colors.grey))
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Container(
                    child: Text('\$${coin.priceUsd}',
                        style: TextStyle(fontSize: 16, color: Colors.black)))),
            Flexible(
                flex: 1,
                child: Container(
                    child: Text('${coin.changePercent24Hr}%',
                        style: TextStyle(fontSize: 16, color: changeColor)))),
          ],
        ));
  }
}
