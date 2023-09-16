import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/product_list_screen.dart';
import '../category_item.dart';

class Categories extends StatelessWidget {
  final ThemeData theme;
  const Categories({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryName: 'Category $index',
            theme: theme,
            onTap: () {
              Get.to(
                () => ProductListScreen(
                  categoryTitle: 'Category Name$index',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
