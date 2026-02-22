import 'dart:io';

import 'package:product_dashboard/feature/add_product/data/model/review_model.dart';
import 'package:product_dashboard/feature/add_product/domain/entity/product_entity.dart';

class ProductModel {
  final String name, describtion;
  final String code, price;
  String? imageurl;
  final bool isFeatured;
  final File image;
  final int expireDate;
  final bool isOrganic;
  final int numberofCalories;
  final int forEachAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    required this.name,
    required this.describtion,
    required this.code,
    required this.price,
    this.imageurl,
    required this.isFeatured,
    required this.image,
    required this.expireDate,
    required this.numberofCalories,
    required this.forEachAmount,
    this.isOrganic = false,
    required this.reviews,
    this.sellingCount=0,
  });

  factory ProductModel.fromEntity(ProductEntity productEntity) {
    return ProductModel(
      name: productEntity.name,
      describtion: productEntity.describtion,
      code: productEntity.code,
      price: productEntity.price,
      isFeatured: productEntity.isFeatured,
      image: productEntity.image,
      imageurl: productEntity.imageurl,
      expireDate: productEntity.expireDate,
      numberofCalories: productEntity.numberofCalories,
      forEachAmount: productEntity.forEachAmount,
      isOrganic: productEntity.isOrganic,
      reviews: productEntity.reviews
          .map((model) => ReviewModel.fromEntity(model))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'describtion': describtion,
      'price': price,
      'imageurl': imageurl,
      "isFeatured": isFeatured,
      "isOrganic": isOrganic,
      "numberofCalories": numberofCalories,
      "forEachAmount": forEachAmount,
      "expireDate": expireDate,
      "reviews": reviews.map((e) => e.toJson()).toList(),
       'sellingCount': sellingCount,
    };
  }
}
