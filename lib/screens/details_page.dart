import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/utils/product_type.dart';
import '../main_provider.dart';
import '../models/meal.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/salad.dart';

class DetailsPage extends StatefulWidget {
  final int selectedItemIndex;
  final ProductType productType;

  const DetailsPage(this.selectedItemIndex, this.productType, {Key? key})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, data, child) {
      return Material(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/bg_details.png'),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 36,
                    ),
                  )),
              Expanded(child: myBody(context)),
            ],
          ),
        ),
      );
    });
  }

  Widget myBody(context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, right: 30),
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildUi(),
          Positioned(
              top: -72,
              right: -48,
              child: Hero(
                tag: widget.selectedItemIndex.toString(),
                child: Image.asset(
                  getMeals()[widget.selectedItemIndex].imageUrl!,
                  height: 220,
                ),
              ))
        ],
      ),
    );
  }

  Widget detailsMeals(Meal meal) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 140),
          Text(
            meal.name!,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
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
                    '20 мин',
                    style: const TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
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
                    '5 инг',
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/ic_kkal.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '438 кал',
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            Meal.mealsRu[0].details!,
            style: const TextStyle(fontSize: 16, height: 1.4),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  Widget detailsSalad(Salad salad) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 140),
          // Text(
          //   salad,
          //   style: TextStyle(
          //     fontSize: 26,
          //     fontWeight: FontWeight.w700,
          //   ),
          // ),
          const SizedBox(height: 16),
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
                    '20 мин',
                    style: const TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
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
                    '5 инг',
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/ic_kkal.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '438 кал',
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            Meal.mealsRu[0].details!,
            style: const TextStyle(fontSize: 16, height: 1.4),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  Widget detailsDrink(Salad salad) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 140),
          // Text(
          //   meal.name!,
          //   style: TextStyle(
          //     fontSize: 26,
          //     fontWeight: FontWeight.w700,
          //   ),
          // ),
          const SizedBox(height: 16),
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
                    '20 мин',
                    style: const TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
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
                    '5 инг',
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/ic_kkal.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '438 кал',
                    style: TextStyle(
                        color: Color(0xff52616B), fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            Meal.mealsRu[0].details!,
            style: const TextStyle(fontSize: 16, height: 1.4),
            textAlign: TextAlign.left,
          )
        ],
      ),
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

  List<Salad> getSalads() {
    switch (context.locale.toString()) {
      case 'uz_UZ':
        {
          return Salad.saladsRu;
        }
      case 'ru_RU':
        {
          return Salad.saladsRu;
        }
      case 'en_US':
        {
          return Salad.saladsRu;
        }
      default:
        return Salad.saladsRu;
    }
  }

  Widget buildUi() {
    switch (widget.productType) {
      case ProductType.DISH:
        {
          return detailsMeals(getMeals()[widget.selectedItemIndex]);
        }
      case ProductType.SALAD:
        {
          return detailsSalad(getSalads()[widget.selectedItemIndex]);
        }
      case ProductType.DRINK:
        {
          return detailsDrink(getSalads()[widget.selectedItemIndex]);
        }
    }
    return detailsMeals(getMeals()[widget.selectedItemIndex]);
  }
}
