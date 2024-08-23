import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/Custom_textField.dart';

class Updateproduct extends StatelessWidget {
  Updateproduct({super.key});
  static String routeName = "Updateproduct";
  String? productname, price, description, image;
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(product.id.toString()),
            Spacer(),
            CustomtextField(
                hint: 'Product Name',
                onChange: (value) {
                  productname = value;
                }),
            SizedBox(
              height: 20,
            ),
            CustomtextField(
                hint: 'Price',
                onChange: (value) {
                  price = value;
                }),
            SizedBox(
              height: 20,
            ),
            CustomtextField(
                hint: 'Description',
                onChange: (value) {
                  description = value;
                }),
            SizedBox(
              height: 20,
            ),
            CustomtextField(
                hint: 'Image',
                onChange: (value) {
                  image = value;
                }),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                Response response = await dio.put(
                  'https://fakestoreapi.com/products/${product.id}',
                  data: {
                    'title': productname,
                    'price': price,
                    'description': description,
                    'image': image,
                    'category': product.category,
                  },
                );
                print('done $response');
              },
              child: Text('Update product'),
            ),
          ],
        ),
      ),
    );
  }
}
