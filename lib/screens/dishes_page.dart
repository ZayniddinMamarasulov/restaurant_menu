import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/main_provider.dart';
import 'package:restaurant_menu/models/meal.dart';
import 'package:restaurant_menu/utils/product_type.dart';
import 'package:restaurant_menu/widgets/product_item.dart';

class DishesPage extends StatefulWidget {
  DishesPage({Key? key}) : super(key: key);

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, data, child) {
      return SafeArea(child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return mainUI(constraints);
          },
        ),
      ));
    });
  }

  Widget mainUI(BoxConstraints constraints) {
    print("CURRENT_WIDTH : ${constraints.maxWidth}");

    var axisCount = 1;
    var current = constraints.maxWidth;

    if (current <= 500) {
      axisCount = 1;
    } else if (current > 500 && current <= 750) {
      axisCount = 2;
    } else if (current > 750 && current <= 1000) {
      axisCount = 3;
    } else {
      axisCount = 4;
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'title'.tr(),
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              scrollDirection: Axis.vertical,
              itemCount: getMeals().length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 1,
                  crossAxisCount: axisCount,
                  mainAxisExtent: 350,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 32),
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                    future: getFavourites(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.contains(index)) {
                          return ProductItem(
                            getMeals()[index],
                            index,
                            isFavourite: true,
                            productType: ProductType.DISH,
                          );
                        } else {
                          return ProductItem(
                            getMeals()[index],
                            index,
                            isFavourite: false,
                            productType: ProductType.DISH,
                          );
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                      // return ProductItem(getMeals()[index], index,
                      //     isFavourite: snapshot.data.contains(index));
                    });
              }),
        )
      ],
    );
  }

  List<Meal> getMeals() {
    switch (context.locale.toString()) {
      case 'uz_UZ':
        {
          return Meal.mealsUz;
        }
      case 'ru_RU':
        {
          return Meal.mealsRu;
        }
      case 'en_US':
        {
          return Meal.mealsEn;
        }
      default:
        return Meal.mealsRu;
    }
  }

  Future<List<int>> getFavourites() async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return await mainProvider.getFavList();
  }

// [1,4,6,9]
}
