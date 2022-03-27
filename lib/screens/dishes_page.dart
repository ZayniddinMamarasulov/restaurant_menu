import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/lang_provider.dart';
import 'package:restaurant_menu/models/meal.dart';
import 'package:restaurant_menu/screens/details_page.dart';

class DishesPage extends StatefulWidget {
  DishesPage({Key? key}) : super(key: key);

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  bool _isItemSelected = false;
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _isItemSelected
            ? setState(() {
                _isItemSelected = false;
              })
            : exit(0);
        return Future.value(false);
      },
      child: Consumer<LangProvider>(builder: (context, data, child) {
        return SafeArea(
            child: _isItemSelected
                ? DetailsPage(_selectedItemIndex)
                : Scaffold(
                    body: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return defaultUI(constraints);
                      },
                    ),
                  ));
      }),
    );
  }

  Widget defaultUI(BoxConstraints constraints) {
    print("width : ${constraints.maxWidth}");
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
              scrollDirection: Axis.vertical,
              itemCount: getMeals().length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: axisCount,
                  mainAxisExtent: 350,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 32),
              itemBuilder: (BuildContext context, int index) {
                return meal(getMeals()[index], context, index);
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

  Widget meal(Meal meal, context, index) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 48,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(meal.bannerColor!)),
              height: 360,
              width: 230,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 48),
                    Row(
                      children: [
                        Container(
                          width: 2,
                          height: 25,
                          color: const Color(0xff00195C),
                        ),
                        SizedBox(width: 4),
                        Text(meal.type!),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 90,
                      child: Text(
                        meal.name!,
                        maxLines: 3,
                        style: const TextStyle(
                            height: 1.3,
                            fontSize: 24,
                            color: Color(0xff1E2022),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${'cost'.tr()}:',
                          style: TextStyle(
                              color: Color(0xff52616B),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          meal.cost!,
                          style: TextStyle(
                              color: Color(0xff52616B),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/ic_dish.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              meal.time!,
                              style: const TextStyle(
                                  color: Color(0xff52616B),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/ic_cal.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              meal.ingCount!.toString(),
                              style: TextStyle(
                                  color: Color(0xff52616B),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/btn_plus.png',
                            height: 50,
                            width: 50,
                          ),
                          Container(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Color(0xff175B8F)))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff175B8F))),
                              onPressed: () {
                                setState(() {
                                  _isItemSelected = true;
                                  _selectedItemIndex = index;
                                });
                              },
                              child: Text('more'.tr()),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
        Positioned(
            top: -24,
            right: -8,
            child: Image.asset(
              meal.imageUrl!,
              height: 170,
              width: 170,
            ))
      ],
    );
  }
}
