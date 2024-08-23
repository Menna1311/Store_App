import 'package:dio/dio.dart';
import 'package:store_app/models/products_model.dart';

class GetProductByCategory {
  Future<List<Product>> getProductByCategory({required String category}) async {
    final Dio dio = Dio();
    Response response =
        await dio.get('https://fakestoreapi.com/products/category/$category');
    print(response.data);
    List<Product> productList = [];
    for (int i = 0; i < response.data.length; i++) {
      productList.add(Product.fromJson(response.data[i]));
    }
    return productList;
  }
}
