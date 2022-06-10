

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:salem_group_task/product.dart';


class ApiControl {
  var dio = Dio();

  static Future<List<product>> fetchProduct() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    return (response.data as List).map((x) => product.fromJson(x)).toList();
  }

  static Future<List<product>> fetchProductByCategorie(
      String categoriename) async {
    Response response = await Dio()
        .get('https://fakestoreapi.com/products/category/$categoriename');
    return (response.data as List).map((x) => product.fromJson(x)).toList();
  }

  static Future<product> fetchProductByID(int aricle_ID) async {
    Response response =
    await Dio().get('https://fakestoreapi.com/products/$aricle_ID');
    product _product = product.fromJson(response.data);
    return _product;
  }
}