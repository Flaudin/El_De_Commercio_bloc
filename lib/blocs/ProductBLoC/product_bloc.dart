import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_event.dart';
import 'package:tracking_app/blocs/ProductBLoC/product_state.dart';
import 'package:tracking_app/data/model/product_model.dart';
import 'package:tracking_app/data/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  List<ProductModel> allproducts = [];

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<FetchProductsByPopular>(onFetchBrands);
    on<RefreshProducts>(onRefreshBrands);
    on<SearchProduct>(onSearchBrands);
  }

  Future<void> onFetchBrands(
    FetchProductsByPopular event,
    Emitter<ProductState> emit,
  ) async {
    if (allproducts.isNotEmpty) {
      emit(ProductLoaded(allproducts));
      return;
    }
    await fetchBrands(emit);
  }

  Future<void> onRefreshBrands(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    allproducts = [];
    await fetchBrands(emit);
  }

  Future<void> fetchBrands(Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await repository.getNewestProduct();
      allproducts = products;
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  onSearchBrands(SearchProduct event, Emitter<ProductState> emit) async {
    if (allproducts.isEmpty) {
      emit(ProductError("No categories available to search."));
      return;
    }

    if (event.query.isEmpty) {
      emit(ProductLoaded(allproducts));
      return;
    }

    final searchQuery = event.query.toLowerCase();
    final filteredCategories =
        allproducts
            .where(
              (product) =>
                  product.productName.toLowerCase().contains(searchQuery),
            )
            .toList();

    emit(ProductLoaded(filteredCategories));
  }
}
