
import 'package:e_markting/features/dashboard/modules/cart/controller/cart_cubit.dart';
import 'package:e_markting/features/dashboard/modules/cart/view/component/cart_item_widget.dart';
import 'package:e_markting/features/dashboard/modules/favorite/controller/favorite_cubit.dart';
import 'package:e_markting/features/dashboard/modules/favorite/view/component/favorite_item_widget.dart';
import 'package:e_markting/features/dashboard/modules/product/controller/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final CartCubit controller = context.read<CartCubit>();
          return Scaffold(
            body: state is ProductStateLoading
                ? const CircularProgressIndicator()
                : state is ProductStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => CartItemWidget(
                          productModel: controller.products[index],
                          controller: controller,
                        ),
                        itemCount: controller.products.length,
                      ),
          );
        },
      ),
    );
  }
}
