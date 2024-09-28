part of 'product_bloc.dart';

sealed class ProductState {}

final class PostInitialState extends ProductState {}
final class LoadedPostSuccessState extends ProductState {
  final List<Product> products;
  LoadedPostSuccessState(this.products);
}
final class ErrorPostState extends ProductState {}
