import 'package:dio/dio.dart';
import 'package:store_app/models/products_model.dart';

class Postproduct {
  Future<Product> postProduct({required Map<String, dynamic> data}) async {
    Map<String, dynamic> data = {
      'title': ' test product',
      'price': ' 13.5',
      'description': 'lorem ipsum set',
      'image': ' https://i.pravatar.cc',
      'category': 'electronic'
    };
    Response response =
        await Dio().post('https://fakestoreapi.com/products', data: data);
    print(response.data);
    return Product.fromJson(response.data);
  }
}
