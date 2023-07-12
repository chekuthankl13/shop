part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLOading extends ProductsState {}

class ProductsLOadError extends ProductsState {
  final String error;

  ProductsLOadError({required this.error});

  @override
  List<Object> get props => [error];
}

class ProductsLOaded extends ProductsState {
  final List<Products> pdts;

  ProductsLOaded({required this.pdts});

  @override
  List<Object> get props => [pdts];
}
