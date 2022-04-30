import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/categories/bloc/states/states.dart';
import 'package:fluttertask/categories/repository/category_repository.dart';


import 'events/events.dart';


class CategoryBloc extends Bloc<CategoryEvent,CategoryState> {
  final CategoryRepository _categoryRepository;

  bool isGridView = false;

  void changeToGridView()
  {
    isGridView = !isGridView;
  }

  CategoryBloc(CategoryRepository categoryRepository)
      :
        _categoryRepository = categoryRepository,
        super(CategoryInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<ChangeLayout>(_onChangeLayout);


  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final products = await _categoryRepository.getProductByCategory(int.parse(event.id??"0"));

      if (products != null ) {
        emit(CategorySuccess(products: products));

      } else {
        emit(CategoryFailure(error: 'Something went wrong'));
        emit(CategoryInitial());
      }
    } catch (err) {
      emit(CategoryFailure(error: err.toString()));
      emit(CategoryInitial());
    }
  }

  Future<void> _onChangeLayout(
      ChangeLayout event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final products = await _categoryRepository.getProductByCategory(int.parse(event.id??"0"));

      if (products != null ) {
        emit(CategorySuccessGridView(products: products));
      } else {
        emit(CategoryFailure(error: 'Something went wrong'));
        emit(CategoryInitial());
      }
    } catch (err) {
      emit(CategoryFailure(error: err.toString()));
      emit(CategoryInitial());
    }
  }
}
