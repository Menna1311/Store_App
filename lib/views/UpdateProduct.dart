import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/Custom_textField.dart';

class Updateproduct extends StatefulWidget {
  Updateproduct({super.key});
  static String routeName = "Updateproduct";

  @override
  State<Updateproduct> createState() => _UpdateproductState();
}

class _UpdateproductState extends State<Updateproduct> {
  String? productname, price, description, image;
  bool isLoading = false;
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
                keyboardType: TextInputType.number,
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
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      try {
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
                      } on Exception catch (e) {
                        // TODO
                      } finally {
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    child: Text('Update product'),
                  ),
          ],
        ),
      ),
    );
  }
}
