import 'package:cripto_stat_app/feature/domain/entities/coin_entity.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/coin_list_cubit/coin_list_cubit.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/coin_list_cubit/coin_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinListCubit, CoinState>(builder: (context, state) {
      List<CoinEntity> coins = [];

      if (state is CoinLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is CoinLoaded) {
        coins = state.coinList;
      }
      return ListView.separated(
          itemBuilder: (context, index) {
            return Text('${coins[index]}');
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
          itemCount: coins.length);
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
