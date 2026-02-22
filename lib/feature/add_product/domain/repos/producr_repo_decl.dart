import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:product_dashboard/core/errors/failuer.dart';
import 'package:product_dashboard/feature/add_product/domain/entity/product_entity.dart';

abstract class ProducrRepoDecl {
  Future<Either<Failuer, void>> addProduct(ProductEntity productEntity);
}

abstract class UploadImageDecl {
  Future<Either<Failuer, String>> uploadImage(File image);
}
