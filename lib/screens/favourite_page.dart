import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_provider.dart';
import '../models/meal.dart';
import '../widgets/product_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return Consumer<MainProvider>(builder: (context, data, child) {
      return FutureBuilder(
          future: mainProvider.getFavList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 1,
                      crossAxisCount: 1,
                      mainAxisExtent: 350,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 32),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      Meal.mealsRu[snapshot.data[index]],
                      snapshot.data[index],
                      isFavourite: true,
                    );
                  });
            }
          });
    });
  }

// [0,3] fav list
// [0,1] fav page
}
