import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_dashboard/core/widgets/custom_button.dart';
import 'package:product_dashboard/core/widgets/custom_form_text_field.dart';
import 'package:product_dashboard/feature/add_product/domain/entity/product_entity.dart';
import 'package:product_dashboard/feature/add_product/presentation/manager/product_cubit/product_cubit.dart';
import 'package:product_dashboard/feature/add_product/presentation/widgets/image_field.dart';
import 'package:product_dashboard/feature/add_product/presentation/widgets/is_featured.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController describtionController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController numberofCaloriesController = TextEditingController();
  TextEditingController forEachAmountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isFeatured = false;
  bool isOrganic = false;
  File? image;
  @override
  void dispose() {
    priceController.dispose();
    nameController.dispose();
    codeController.dispose();
    describtionController.dispose();
    expireDateController.dispose();
    numberofCaloriesController.dispose();
    forEachAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 16,
            children: [
              const SizedBox(height: 16),
              CustomFormTextField(
                hintText: 'product name',
                controller: nameController,
              ),
              CustomFormTextField(
                hintText: 'product price',
                keyboardType: TextInputType.number,
                controller: priceController,
              ),
              CustomFormTextField(
                hintText: 'product code',
                keyboardType: TextInputType.number,
                controller: codeController,
              ),
              CustomFormTextField(
                hintText: 'product describtion',
                maxLine: 5,
                controller: describtionController,
              ),
              CustomFormTextField(
                hintText: 'number of calory',

                controller: numberofCaloriesController,
              ),
              CustomFormTextField(
                hintText: 'for each amount',

                controller: forEachAmountController,
              ),
              CustomFormTextField(
                hintText: 'expire date',

                controller: expireDateController,
              ),
              ImageField(
                onFileChanged: (value) {
                  image = value;
                },
              ),
              IsFeatured(
                text: 'is featured',
                onChangedTerms: (bool value) {
                  isFeatured = value;
                },
              ),
              IsFeatured(
                text: 'is organic',
                onChangedTerms: (bool value) {
                  isOrganic = value;
                },
              ),
              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      ProductEntity input = ProductEntity(
                        reviews: [],
                        name: nameController.text,
                        describtion: describtionController.text,
                        code: codeController.text.toLowerCase(),
                        price: priceController.text,
                        isFeatured: isFeatured,
                        isOrganic: isOrganic,
                        image: image!,
                        expireDate: int.parse(expireDateController.text),
                        numberofCalories: int.parse(
                          numberofCaloriesController.text,
                        ),

                        forEachAmount: int.parse(forEachAmountController.text),
                      );
                      context.read<ProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Error try again')));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
