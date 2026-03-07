import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_event.dart';
import 'package:tracking_app/blocs/BrandBLoC/brand_state.dart';
import 'package:tracking_app/data/model/brand_model.dart';
import 'package:tracking_app/data/repositories/brand_repository.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository repository;
  List<BrandModel> allbrands = [];

  BrandBloc(this.repository) : super(BrandInitial()) {
    on<FetchBrandsByPopular>(onFetchBrands);
    on<RefreshBrands>(onRefreshBrands);
    on<SearchBrands>(onSearchBrands);
    on<FetchBrandsByCategory>(onFetchBrandsByCategory);
  }

  Future<void> onFetchBrands(
    FetchBrandsByPopular event,
    Emitter<BrandState> emit,
  ) async {
    if (allbrands.isNotEmpty) {
      emit(BrandLoaded(allbrands));
      return;
    }
    await fetchBrands(emit);
  }

  Future<void> onRefreshBrands(
    RefreshBrands event,
    Emitter<BrandState> emit,
  ) async {
    allbrands = [];
    await fetchBrands(emit);
  }

  Future<void> fetchBrands(Emitter<BrandState> emit) async {
    emit(BrandLoading());
    try {
      final brands = await repository.fetchPopularBrands();
      allbrands = brands;
      emit(BrandLoaded(brands));
    } catch (e) {
      emit(BrandError(e.toString()));
    }
  }

  onSearchBrands(SearchBrands event, Emitter<BrandState> emit) async {
    if (allbrands.isEmpty) {
      emit(BrandError("No categories available to search."));
      return;
    }

    if (event.query.isEmpty) {
      emit(BrandLoaded(allbrands));
      return;
    }

    final searchQuery = event.query.toLowerCase();
    final filteredCategories =
        allbrands
            .where(
              (brands) => brands.brandName.toLowerCase().contains(searchQuery),
            )
            .toList();

    emit(BrandLoaded(filteredCategories));
  }

  onFetchBrandsByCategory(
    FetchBrandsByCategory event,
    Emitter<BrandState> emit,
  ) async {
    emit(BrandLoading());
    try {
      final brands = await repository.fetchBrandByCategory(event.categoryId);
      emit(BrandLoaded(brands));
    } catch (e) {
      emit(BrandError(e.toString()));
    }
  }
}
