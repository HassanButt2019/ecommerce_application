import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/home/bloc/states/states.dart';
import 'package:fluttertask/home/repository/home_repository.dart';
import 'package:fluttertask/home/view/view.dart';

import 'events/events.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(HomeRepository homeRepository)
      :
        _homeRepository = homeRepository,
        super(HomeInitial()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
      LoadCategories event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final categories = await _homeRepository.getAllCategories();

      if (categories != null ) {

        emit(CategorySuccess(categories: categories));

      } else {
        emit(HomeFailure(error: 'Something went wrong'));
        emit(HomeInitial());
      }
    } catch (err) {
      emit(HomeFailure(error: err.toString()));
      emit(HomeInitial());
    }
  }
}
