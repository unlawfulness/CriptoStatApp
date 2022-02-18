import 'package:flutter/material.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => Container(
        child: ListTile(
          leading: const Text(
            'CoinImage',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Coin name', style: TextStyle(fontWeight: FontWeight.bold),),
              const Text('price'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  const Text('some more'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
