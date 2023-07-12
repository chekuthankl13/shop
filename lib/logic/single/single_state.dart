part of 'single_cubit.dart';

abstract class SingleState extends Equatable {
  const SingleState();

  @override
  List<Object> get props => [];
}

class SingleInitial extends SingleState {}

class SProductsLOading extends SingleState {}

class SProductsLOadError extends SingleState {
  final String error;

  SProductsLOadError({required this.error});

  @override
  List<Object> get props => [error];
}

class SProductsLOaded extends SingleState {
  final SIngleProducts pdts;

  SProductsLOaded({required this.pdts});

  @override
  List<Object> get props => [pdts];
}
