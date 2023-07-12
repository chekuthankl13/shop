part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoadError extends AuthState {
  final String error;

  const AuthLoadError({required this.error});

  @override
  List<Object> get props => [error];
}

class AuthLoaded extends AuthState {
  final AuthModel credentials;

  const AuthLoaded({required this.credentials});

  @override
  List<Object> get props => [credentials];
}
