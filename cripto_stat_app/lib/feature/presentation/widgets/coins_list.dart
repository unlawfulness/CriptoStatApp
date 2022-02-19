import 'dart:async';

import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/coin_list_cubit/coin_list_cubit.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/coin_list_cubit/coin_list_state.dart';
import 'package:cripto_stat_app/feature/presentation/widgets/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsList extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<CoinListCubit>().loadCoin();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<CoinListCubit, CoinState>(builder: (context, state) {
      List<CoinEntity> coins = [];
      bool isLoading = false;

      if (state is CoinLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is CoinLoading) {
        coins = state.oldCoinList;
        isLoading = true;
      } else if (state is CoinLoaded) {
        coins = state.coinList;
      }
      return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < coins.length) {
              return CoinCard(coin: coins[index]);
            } else {
              Timer(Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              return _loadingIndicator();
            }
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          itemCount: coins.length + (isLoading ? 1 : 0));
    });
  }
}

Widget _loadingIndicator() {
  return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ));
}
