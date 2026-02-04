import 'package:dio/dio.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductsFromApi({String? category});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProductsFromApi({String? category}) async {
    final url = category != null && category != 'All Products'
        ? 'https://fakestoreapi.com/products/category/${category.toLowerCase()}'
        : 'https://fakestoreapi.com/products';

    final response = await client.get(url);

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
