import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:product_dashboard/core/errors/failuer.dart';
import 'package:product_dashboard/core/service/data_base_service.dart';
import 'package:product_dashboard/core/service/storage_service.dart';
import 'package:product_dashboard/core/utils/end_points.dart';
import 'package:product_dashboard/feature/add_product/data/model/add_product_model.dart';
import 'package:product_dashboard/feature/add_product/domain/entity/product_entity.dart';
import 'package:product_dashboard/feature/add_product/domain/repos/producr_repo_decl.dart';

class ProductRepoImpl implements ProducrRepoDecl {
  final DataBaseService dataBaseService;

  ProductRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failuer, void>> addProduct(ProductEntity productEntity) async {
    try {
      await dataBaseService.addData(
        path: EndPoints.addProduct,
        data: ProductModel.fromEntity(productEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(ServerFailuer('failed to add product'));
    }
  }
}

class ImageUpload implements UploadImageDecl {
  final StorageService storageService;

  ImageUpload({required this.storageService});

  @override
  Future<Either<Failuer, String>> uploadImage(File image) async {
    try {
      var url = await storageService.uploadImage(image);
      return right(url);
    } catch (e) {
      log(e.toString());
      return left(ServerFailuer('failed to upload image'));
    }
  }
}
