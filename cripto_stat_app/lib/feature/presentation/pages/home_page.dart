// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/coins_list.dart';
import '../widgets/filter_buttons.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto statistic'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //FilterButtons(),
          Expanded(
            child: CoinsList(),
          ),
        ],
      ),
    );
  }
}
