part of 'states.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}


class CategorySuccess extends HomeState {
  final List<Categories>? categories;

  CategorySuccess({required this.categories});

  @override
  List<Object> get props => [categories!];

}

class HomeFailure extends HomeState {
  final String? error;
  HomeFailure({required this.error});

  @override
  List<Object> get props => [error!];
}
