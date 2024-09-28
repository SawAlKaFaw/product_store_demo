import 'package:dio/dio.dart';

import '../model/product.dart';

class ApiService{
  Dio dio = Dio();
  Future<List<Product>>getData() async{
    Uri uri = Uri.parse("https://fakestoreapi.com/products");
    var response = await dio.getUri(uri);
    return (response.data as List).map((data){
      return Product.fromJson(data);
    }).toList();
  }

}