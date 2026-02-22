import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_dashboard/core/service/get_it.dart';
import 'package:product_dashboard/core/utils/app_color.dart';
import 'package:product_dashboard/feature/add_product/domain/repos/producr_repo_decl.dart';
import 'package:product_dashboard/feature/add_product/presentation/manager/product_cubit/product_cubit.dart';
import 'package:product_dashboard/feature/add_product/presentation/widgets/add_product_view_body_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'AddProduct';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getit.get<ProducrRepoDecl>(),
        getit.get<UploadImageDecl>(),
      ),
      child: Scaffold(
        backgroundColor: AppColor.appGrayColor,
        appBar: AppBar(
          backgroundColor: AppColor.appGrayColor,
          title: Text('Add YourP roduct'),
          centerTitle: true,
        ),
        body: const AddProductViewBodyBuilder(),
      ),
    );
  }
}
