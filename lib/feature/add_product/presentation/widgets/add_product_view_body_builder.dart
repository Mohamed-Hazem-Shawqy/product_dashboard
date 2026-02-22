import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:product_dashboard/feature/add_product/presentation/manager/product_cubit/product_cubit.dart';
import 'package:product_dashboard/feature/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductViewBodyBuilder extends StatelessWidget {
  const AddProductViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Product added successfully')));
        } else if (state is ProductFailuer) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
