import 'package:hive/hive.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box<ProductModel> productBox;

  ProductLocalDataSourceImpl({required this.productBox});

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    return productBox.values.toList();
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await productBox.clear();
    for (var product in products) {
      productBox.put(product.id, product);
    }
  }
}
