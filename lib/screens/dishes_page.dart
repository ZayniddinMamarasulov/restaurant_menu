import 'dart:ui';

import 'package:flutter/material.dart';

class DishesPage extends StatelessWidget {
  DishesPage({Key? key}) : super(key: key);

  final List<Color> _colors = const [
    Color(0xffF2DFE1),
    Color(0xffDCC7B1),
    Color(0xffFFC5A8),
    Color(0xff71C3A1),
    Color(0xffA8B6FF),
    Color(0xffFFE7A8),
    Color(0xffCEA8FF),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text(
            //   'Мы очень рады что  вы выбрали\nНаше ресторан, спасибо за визит!',
            //   style: TextStyle(fontSize: 16),
            // ),
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 320,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 32),
                  itemBuilder: (BuildContext context, int index) {
                    return meal(index);
                  }),
            )
          ],
        ),
      )),
    );
  }

  Widget meal(index) {
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
                  color: _colors[index]),
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
                        Text('Кавказская'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Шашлык бараньих ребрышек',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff1E2022),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Стоимость:',
                          style: TextStyle(
                              color: Color(0xff52616B),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '904 000 sum',
                          style: TextStyle(
                              color: Color(0xff52616B),
                              fontWeight: FontWeight.w600),
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
                                          side: BorderSide(
                                              color: Color(0xff175B8F)))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff175B8F))),
                              onPressed: () {},
                              child: Text('Подробнее'),
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
              'assets/meal1.png',
              height: 170,
              width: 170,
            ))
      ],
    );
  }
}
