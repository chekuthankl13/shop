import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/models/products/all_product_model.dart';
import 'package:task/repository/api_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiRepository apiRepository;
  ProductsCubit({required this.apiRepository}) : super(ProductsInitial());

  getAllPdt() async {
    try {
      emit(ProductsLOading());

      var res = await apiRepository.getAll();

      if (res['status'] == 'ok') {
        var data = res['data'] as AllProductModel;

        emit(ProductsLOaded(pdts: data.products));
      } else {
        emit(ProductsLOadError(error: res['message']));
      }
    } catch (e) {
      emit(ProductsLOadError(error: e.toString()));
    }
  }
}
