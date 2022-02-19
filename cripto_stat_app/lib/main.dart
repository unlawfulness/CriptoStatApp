// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:cripto_stat_app/common/app_colors.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/coin_list_cubit/coin_list_cubit.dart';
import 'package:cripto_stat_app/feature/presentation/bloc/search_bloc/search_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/presentation/pages/home_page.dart';
import 'locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.itin();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CoinListCubit>(
              create: (context) => di.sl<CoinListCubit>()..loadCoin()),
          BlocProvider<CoinSearchBlock>(
              create: (context) => di.sl<CoinSearchBlock>()),
        ],
        child: MaterialApp(
            theme: ThemeData.dark().copyWith(
                backgroundColor: AppColors.mainBacground,
                scaffoldBackgroundColor: AppColors.mainBacground),
            title: 'Coin stat',
            home: HomePage()));
    // return MaterialApp(
    //     theme: ThemeData(
    //       primaryColor: Colors.blue,
    //       colorScheme:
    //           ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
    //     ),
    //     title: 'Demo app provider',
    //     home: HomePage());
  }
}
