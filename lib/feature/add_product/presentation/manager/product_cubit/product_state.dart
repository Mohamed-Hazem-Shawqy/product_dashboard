part of 'product_cubit.dart';

@immutable
sealed class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {}

final class ProductFailuer extends ProductState {
  final String errMessage;

  const ProductFailuer({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
