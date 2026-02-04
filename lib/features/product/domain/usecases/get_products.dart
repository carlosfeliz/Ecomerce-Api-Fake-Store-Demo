import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProducts implements UseCase<List<Product>, ProductParams> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(ProductParams params) {
    return repository.getProducts(category: params.category);
  }
}

class ProductParams extends Equatable {
  final String? category;

  const ProductParams({this.category});

  @override
  List<Object?> get props => [category];
}
