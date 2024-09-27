import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'features/product/data/datasources/product_local_data_source.dart';
import 'features/product/data/datasources/product_remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/get_products.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/data/models/product_model.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ProductBloc(getProducts: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetProducts(sl()));

  // Repositories
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
  ));

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(productBox: sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  
  // Registro del Box<ProductModel>
  var productBox = await Hive.openBox<ProductModel>('productsBox');
  sl.registerLazySingleton<Box<ProductModel>>(() => productBox);
}
