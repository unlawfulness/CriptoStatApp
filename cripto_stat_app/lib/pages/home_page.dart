// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cripto_stat_app/bloc/coin_bloc.dart';
import 'package:cripto_stat_app/services/coin_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/coins_list.dart';
import '../widgets/filter_buttons.dart';

class HomePage extends StatelessWidget {
  final coinRepository = CoinRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoinBloc>(
      create: (context) => CoinBloc(coinRepository),
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text('Crypto statistic'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //FilterButtons(),
            Expanded(child: CoinsList(),),
          ],
        ),
      ),
    );
  }
}
