import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/updata_product_page.dart';

// flutter build web --release && firebase init hosting && firebase deploy --only hosting -m 'V 1.0.0'
// firebase deploy --only hosting -m ' V 1.0.1'
//flutter build web --release && firebase deploy --only hosting -m 'V 1.0.1'
void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) =>  HomePage(),
        UpdataProductPage.id: (context) =>  UpdataProductPage(),
      },
      initialRoute: HomePage.id,
      
    );
  }
}
