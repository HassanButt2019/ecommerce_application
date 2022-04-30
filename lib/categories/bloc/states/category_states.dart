part of 'states.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}


class CategorySuccess extends CategoryState {
  final List<Products>? products;

  CategorySuccess({required this.products});

  @override
  List<Object> get props => [products!];

}

class CategorySuccessGridView extends CategoryState {
  final List<Products>? products;

  CategorySuccessGridView({required this.products});

  @override
  List<Object> get props => [products!];

}

class CategoryFailure extends CategoryState {
  final String? error;
  CategoryFailure({required this.error});

  @override
  List<Object> get props => [error!];
}
