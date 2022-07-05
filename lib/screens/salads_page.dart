import 'package:flutter/material.dart';
import 'package:restaurant_menu/utils/product_type.dart';
import 'package:restaurant_menu/widgets/product_item.dart';

import '../models/meal.dart';

class SaladsPage extends StatelessWidget {
  const SaladsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Salads'),
            SizedBox(height: 40),
            ProductItem(Meal.mealsRu[0], 0, productType: ProductType.SALAD),
          ],
        ),
      ),
    );
  }
}
