import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:product_dashboard/feature/add_product/domain/entity/product_entity.dart';
import 'package:product_dashboard/feature/add_product/domain/repos/producr_repo_decl.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.producrRepoDecl, this.uploadImageDecl)
    : super(ProductInitial());
  final ProducrRepoDecl producrRepoDecl;
  final UploadImageDecl uploadImageDecl;

  Future<void> addProduct(ProductEntity productEntity) async {
    emit(ProductLoading());
    var result = await uploadImageDecl.uploadImage(productEntity.image);
    result.fold(
      (failuer) => emit(ProductFailuer(errMessage: failuer.message)),
      (url) async {
        productEntity.imageurl = url;
        var result = await producrRepoDecl.addProduct(productEntity);
        result.fold(
          (failuer) => emit(ProductFailuer(errMessage: failuer.message)),
          (success) => emit(ProductSuccess()),
        );
      },
    );
  }
}
