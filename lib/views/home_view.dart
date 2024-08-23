import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/getCategories.dart';
import 'package:store_app/services/getproducts.dart';
import 'package:store_app/services/postProduct.dart';
import 'package:store_app/services/product_ByCategory.dart';
import 'package:store_app/widgets/Custom_card.dart';

// ignore: must_be_immutable
// class HomeView extends StatelessWidget {
//   HomeView({super.key});
//   AllProductService getallprod = AllProductService();
//   GetAllCategories cat = GetAllCategories();
//   GetProductByCategory pro = GetProductByCategory();
//   Postproduct psot = Postproduct();
//   Dio dio = Dio();
//   Map<String, dynamic> data = {
//     'title': ' test product',
//     'price': ' 13.5',
//     'description': 'lorem ipsum set',
//     'image': ' https://i.pravatar.cc',
//     'category': 'electronic'
//   };
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               getallprod.getAllProducts();
//             },
//             child: Text('Get Products'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               cat.getAllCategories();
//             },
//             child: Text('Get cat'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               pro.getProductByCategory(category: 'electronics');
//             },
//             child: Text('Get cat'),
//           ),
//           Spacer(),
//           ElevatedButton(
//             onPressed: () {
//               psot.postProduct(data: data);
//             },
//             child: Text('post'),
//           ),
//         ],
//       ),
//     );
//   }
// }
class HomeView extends StatelessWidget {
  HomeView({super.key});
  AllProductService getallprod = AllProductService();
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('New Trend'),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: FutureBuilder<List<Product>>(
            future: AllProductService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(top: 60, right: 10, left: 10),
                  child: GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 100,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.4),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Custom_Card(
                            product: products[index],
                          ),
                        );
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
