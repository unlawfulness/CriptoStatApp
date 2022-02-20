import 'package:cripto_stat_app/common/app_colors.dart';
import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
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
    return Card(
      margin: EdgeInsets.all(5),
      child: ListTile(
          textColor: Colors.white,
          leading: Text(
            coin.rank,
            style: TextStyle(fontSize: 17, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          title: Text(coin.name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.start),
          subtitle: Text(coin.symbol,
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.start),
          trailing: Container(
              child: Text('\$${getNumber(coin.priceUsd, precision: 2)}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.start))),
    );

    // Container(
    //     decoration: BoxDecoration(
    //         color: AppColors.cellBacground,
    //         borderRadius: BorderRadius.circular(5)),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         SizedBox(width: 3),
    //         Flexible(
    //           flex: 1,
    //           child: Container(
    //               child: Text(
    //             coin.rank,
    //             style: TextStyle(fontSize: 17, color: Colors.black),
    //             textAlign: TextAlign.left,
    //           )),
    //         ),
    //         Flexible(
    //             flex: 3,
    //             child: Container(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Text(coin.name,
    //                       style: TextStyle(
    //                           fontSize: 16,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.black),
    //                       textAlign: TextAlign.start),
    //                   Text(coin.symbol,
    //                       style: TextStyle(fontSize: 14, color: Colors.grey),
    //                       textAlign: TextAlign.start)
    //                 ],
    //               ),
    //             )),
    //         Flexible(
    //             flex: 1,
    //             child: Container(
    //                 child: Text('\$${getNumber(coin.priceUsd, precision: 2)}',
    //                     style: TextStyle(fontSize: 16, color: Colors.black),
    //                     textAlign: TextAlign.start))),
    //         Flexible(
    //             flex: 1,
    //             child: Container(
    //                 child: Text(
    //                     '${getNumber(coin.changePercent24Hr, precision: 2)}%',
    //                     style: TextStyle(fontSize: 16, color: changeColor),
    //                     textAlign: TextAlign.start))),
    //       ],
    //     ));
  }
}
