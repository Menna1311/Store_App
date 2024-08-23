import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class AllProductService {
  Future<List<Product>> getAllProducts() async {
    Api api = Api();
    Response response = await api.get(url: 'https://fakestoreapi.com/products');
    print(response.data);
    List<Product> productList = [];
    for (int i = 0; i < response.data.length; i++) {
      productList.add(Product.fromJson(response.data[i]));
    }
    return productList;
  }
}
