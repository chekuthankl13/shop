import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/logic/bloc_export.dart';
import 'package:task/models/products/single_product_model.dart';

part 'single_state.dart';

class SingleCubit extends Cubit<SingleState> {
  final ApiRepository apiRepository;
  SingleCubit({required this.apiRepository}) : super(SingleInitial());

  getSIngle({required id}) async {
    try {
      emit(SProductsLOading());
      var res = await apiRepository.singlePdt(id: id);
      if (res['status'] == 'ok') {
        var data = res['data'] as SIngleProducts;

        emit(SProductsLOaded(pdts: data));
      } else {
        emit(SProductsLOadError(error: res['message']));
      }
    } catch (e) {
      emit(SProductsLOadError(error: e.toString()));
    }
  }
}
