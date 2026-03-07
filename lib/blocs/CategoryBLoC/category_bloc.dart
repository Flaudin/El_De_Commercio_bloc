import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tracking_app/blocs/CategoryBLoC/category_event.dart';
import 'package:tracking_app/blocs/CategoryBLoC/category_state.dart';
import 'package:tracking_app/data/model/category_model.dart';
import 'package:tracking_app/data/repositories/brand_repository.dart';
import 'package:tracking_app/data/repositories/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;
  final BrandRepository brandRepository;
  List<CategoryModel> allCategories = [];

  CategoryBloc(this.repository, this.brandRepository) : super(CategoryInitial()) {
    on<FetchCategories>(onFetchCategories);
    on<RefreshCategories>(onRefreshCategories);
    on<SearchCategories>(onSearchCategories);
  }

  Future<void> onFetchCategories(
    FetchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    if (allCategories.isNotEmpty) {
      emit(CategoryLoaded(allCategories)); 
      return;
    }
    await fetchCategories(emit);
  }

  Future<void> onRefreshCategories(
    RefreshCategories event,
    Emitter<CategoryState> emit,
  ) async {
    allCategories = [];
    await fetchCategories(emit);
  }

  Future<void> fetchCategories(Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await repository.getAllCategories();
      allCategories = categories;
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  onSearchCategories(
    SearchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    if (allCategories.isEmpty) {
      emit(CategoryError("No categories available to search."));
      return;
    }

    if (event.query.isEmpty) {
      emit(CategoryLoaded(allCategories));
      return;
    }

    final searchQuery = event.query.toLowerCase();
    final filteredCategories =
        allCategories
            .where(
              (category) => category.title.toLowerCase().contains(searchQuery),
            )
            .toList();

    emit(CategoryLoaded(filteredCategories));
  }

  onFilteredBrandsByCategory(
    OnFilteredBrandsByCategory event,
    Emitter<CategoryState> emit,
  )async{
    // Implement the logic to filter brands by category using event.categoryId
    emit(CategoryLoading());
    try {
      final brands = await brandRepository.fetchBrandByCategory(event.categoryId);
      emit(CategoryBrandLoaded(brands));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
