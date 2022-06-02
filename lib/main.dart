import 'package:flutter/material.dart';
import 'package:restaurantappp/datajsn/restaurant.dart';
import 'package:restaurantappp/ui/resto_detail_page.dart';
import 'package:restaurantappp/ui/resto_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'HalamanPertama',
      routes: {
        'HalamanPertama': (context) =>  const RestoListPage(),
        'HalamanKedua': (context) => RestoDetailPage(
          restaurants:
          ModalRoute.of(context)?.settings.arguments as Restaurant,
        )
      },
    );
  }
}
