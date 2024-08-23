import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategories {
  Future<Response<dynamic>> getAllCategories() async {
    final Api api = Api();
    Response<dynamic> categoryList =
        await api.get(url: 'https://fakestoreapi.com/products/categories');
    print(categoryList);
    return categoryList;
  }
}
