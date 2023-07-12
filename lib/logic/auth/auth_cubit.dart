import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/db/db.dart';
import 'package:task/models/auth/auth_model.dart';
import 'package:task/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthREpository authREpository;
  AuthCubit({required this.authREpository}) : super(AuthInitial());

  signIn({required name, required password}) async {
    try {
      emit(AuthLoading());

      var res = await authREpository.login(name: name, password: password);
      if (res['status'] == "ok") {
        var data = res['data'] as AuthModel;
        await setUser(
            email: data.email,
            gender: data.gender,
            id: data.id,
            img: data.img,
            token: data.token,
            username: data.userName);
        emit(AuthLoaded(credentials: data));
      } else {
        emit(AuthLoadError(error: res['message']));
      }
    } catch (e) {
      emit(AuthLoadError(error: e.toString()));
    }
  }
}
