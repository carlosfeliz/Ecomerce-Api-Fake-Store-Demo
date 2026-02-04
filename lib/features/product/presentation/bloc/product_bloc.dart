import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../../../../core/error/failures.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  List<Product> _allProducts = [];

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final failureOrProducts = await getProducts(ProductParams(category: event.category));

      failureOrProducts.fold(
        (failure) => emit(ProductError(_mapFailureToMessage(failure))),
        (products) {
          _allProducts = products;
          emit(ProductLoaded(products));
        },
      );
    });

    on<SearchProductsEvent>((event, emit) {
      if (_allProducts.isEmpty) return;

      final filteredProducts = _allProducts.where((product) {
        return product.title.toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      emit(ProductLoaded(filteredProducts));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Failure';
    } else if (failure is CacheFailure) {
      return 'Cache Failure';
    } else {
      return 'Unexpected error';
    }
  }
}
