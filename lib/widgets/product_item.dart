import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/screens/details_page.dart';
import 'package:restaurant_menu/utils/navigator_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_provider.dart';
import '../models/meal.dart';

class ProductItem extends StatefulWidget {
  final Meal meal;
  final int index;

  const ProductItem(this.meal, this.index, {Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    if (mounted) {
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

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
                  color: Color(widget.meal.bannerColor!)),
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
                        Text(widget.meal.type!),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 90,
                      child: Text(
                        widget.meal.name!,
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
                          widget.meal.cost!,
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
                              widget.meal.time!,
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
                              widget.meal.ingCount!.toString(),
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
                          // Image.asset(
                          //   'assets/btn_plus.png',
                          //   height: 50,
                          //   width: 50,
                          // ),
                          IconButton(
                              onPressed: () async {
                                List<int> favList =
                                    await mainProvider.getFavList();
                                var newList = List.of(favList);
                                if (!newList.contains(widget.index)) {
                                  newList.add(widget.index);
                                }
                                mainProvider.setFavList(newList);
                              },
                              icon: Icon(Icons.favorite_border_outlined)),
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
                                  Navigator.of(context).push(
                                      createRoute(DetailsPage(widget.index)));
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
            child: Hero(
              tag: 'productImage',
              child: Image.asset(
                widget.meal.imageUrl!,
                height: 170,
                width: 170,
              ),
            ))
      ],
    );
  }
}
