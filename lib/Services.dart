// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:mybook/Featuer/home/data/Model/book_model/book_model.dart';
// import 'package:mybook/Featuer/home/domain/Entity/BookEntity.dart';

import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
//  if (_apiServices != null) {
//       var data = await _apiServices.get(endPoint: "yourEndPoint");
//       // استخدم البيانات هنا
//     } else {
//       throw Exception("apiServices has not been initialized");
  final String _url = "https://www.googleapis.com/books/v1/";
  ApiServices(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var res = await _dio.get("$_url$endPoint");
    return res.data;
  }
}
// class Api {
//   Future<http.Response> get(
//       {required String url, required String endPoint}) async {
//     http.Response response = await http.get(Uri.parse("${url + endPoint}"));
//     if (response.statusCode == 200) {
//       return response;
//     } else {
//       throw Exception("the response.statusCode${response.statusCode}");
//     }
//   }

//   final String url = "https://www.googleapis.com/books/v1";

//   Future<List<BookEntity>> fechFeatuerBooks() async {
//     final String _endPoint = "volumes?Filtering=free-ebooks&q=programming";

//     http.Response _response = await get(url: url, endPoint: _endPoint);
//     Map<String, dynamic> data = jsonDecode(_response.body);

//     List<BookEntity> books = [];
//     for (var bookMap in data["items"]) {
//       books.add(
//         BookModel.fromJson(
//           bookMap,
//         ),
//       );
//     }
//     return books;
//   }

//   Future<List<BookEntity>> fechNewestBooks() async {
//     final String _endPoint =
//         "volumes?Filtering=free-ebooks&Sorting=newest&q=programming";

//     http.Response _response = await get(url: url, endPoint: _endPoint);
//     Map<String, dynamic> data = jsonDecode(_response.body);

//     List<BookEntity> books = [];
//     for (var bookMap in data["items"]) {
//       books.add(BookModel.fromJson(bookMap));
//     }
//     return books;
//   }

  // Future post({required String url, @required dynamic body}) async {
  //   http.Response response = await http.post(
  //     Uri.parse(
  //       "$url",
  //     ),
  //     body: body,
  //   );
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception("the response.statusCode${response.statusCode}");
  //   }
  // }

  // Future put({required String url, @required dynamic body}) async {
  //   print("the body${body}");
  //   http.Response response = await http.post(
  //     Uri.parse(
  //       "$url",
  //     ),
  //     body: body,
  //   );
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     return data;
  //   } else {
  //     throw Exception("the response.statusCode${response.statusCode}");
  //   }
  // }
// }

// class ProductsService {
//   final String _baseUrl = "https://fakestoreapi.com/products";
//   Future<List<ProductModel>> getAllProducts() async {
//     http.Response response = await http.get(Uri.parse(_baseUrl));
//     List<dynamic> data = jsonDecode(response.body);
//     List<ProductModel> productList = [];
//     for (int i = 0; i < data.length; i++) {
//       productList.add(
//         ProductModel.fromjson(
//           data[i],
//         ),
//       );
//     }
//     return productList;
//   }
// }

// class CategoriseService {
//   final String _baseUrl = "https://fakestoreapi.com/products/categories";
//   Future<List> getAllCategorise() async {
//     http.Response response = await Api().get(url: _baseUrl);

//     List data = jsonDecode(response.body);
//     return data;
//   }
// }

// class AllCategoriseService {
//   Future<List> getAllCategoryProducts({required String category_name}) async {
//     final String _baseUrl =
//         "https://fakestoreapi.com/products/category/${category_name}";
//     http.Response response = await Api().get(url: _baseUrl);
//     List data = jsonDecode(response.body);
//     return data;
//   }
// }

// class AddProduct {
//   Future<ProductModel> addProduct({
//     required String tilte,
//     required String price,
//     required String desc,
//     required String image,
//     required String category,
//   }) async {
//     Map<String, dynamic> data = await Api().post(
//       url: "https://fakestoreapi.com/products",
//       body: {
//         "title": tilte,
//         "price": price,
//         "description": desc,
//         "image": image,
//         "category": category,
//       },
//     );
//     return ProductModel.fromjson(data);
//   }
// }

// class UpdataProduct {
//   Future<ProductModel> UpdateProduct({
//     required int id,
//     required String tilte,
//     required String price,
//     required String desc,
//     required String image,
//     required String category,
//   }) async {
//     Map<String, dynamic> data = await Api().put(
//       url: "https://fakestoreapi.com/products/:id",
//       body: {
//         "title": tilte,
//         "price": price,
//         "description": desc,
//         "image": image,
//         "category": category,
//       },
//     );

//     return ProductModel.fromjson(data);
//   }
// }
