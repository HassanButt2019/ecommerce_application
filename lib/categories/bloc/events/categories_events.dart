part of 'events.dart';


abstract class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class LoadProducts extends CategoryEvent  {
  final String? id;
  LoadProducts({this.id});

  @override
  List<Object> get props => [id!];
}


class ChangeLayout extends CategoryEvent  {
  final String? id;
  ChangeLayout({this.id});

  @override
  List<Object> get props => [id!];
}
