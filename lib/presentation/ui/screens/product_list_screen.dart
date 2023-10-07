import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../state_holders/product_list_controller.dart';
import '../widgets/product.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryTitle;
  final int categoryId;
  const ProductListScreen({
    super.key,
    required this.categoryTitle,
    required this.categoryId,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductListController>().getProducts(widget.categoryId);
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.find<ProductListController>().clearProductList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: Text(
          widget.categoryTitle,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<ProductListController>(
        builder: (productListController) {
          if (productListController.productModel.data?.isEmpty ?? true) {
            return const Center(child: Text('No Product'));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(5.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 2.3 / 3,
            ),
            itemCount: productListController.productModel.data?.length ?? 0,
            itemBuilder: (cntxt, index) {
              return FittedBox(
                child: Product(
                  product: productListController.productModel.data![index],
                  theme: theme,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
