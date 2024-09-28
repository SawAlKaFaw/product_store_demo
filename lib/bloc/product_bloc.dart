import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/product.dart';
import '../service/api_service.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<PostEvent, ProductState> {
  final ApiService apiService;

  ProductBloc({required this.apiService}) : super(PostInitialState()) {
    on<LoadedPostSuccessEvent>((event, emit) async {
      emit(PostInitialState());
      await Future.delayed(const Duration(seconds: 1));
      var result = await apiService.getData();
      emit(LoadedPostSuccessState(result));
    });
  }
}
