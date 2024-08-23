import 'package:flutter/material.dart';
import 'package:store_app/views/UpdateProduct.dart';
import 'package:store_app/views/home_view.dart';

void main() {
  runApp(const store_app());
}

class store_app extends StatelessWidget {
  const store_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => HomeView(),
        Updateproduct.routeName: (context) => Updateproduct(),
      },
      initialRoute: HomeView.id,
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
