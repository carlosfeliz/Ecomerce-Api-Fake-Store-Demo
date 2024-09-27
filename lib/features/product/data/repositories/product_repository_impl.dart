import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getProductsFromApi();
      await localDataSource.cacheProducts(remoteProducts);
      return Right(remoteProducts);
    } catch (e) {
      try {
        final localProducts = await localDataSource.getCachedProducts();
        return Right(localProducts);
      } catch (e) {
        return const Left(CacheFailure('No cache available.'));
      }
    }
  }
}
