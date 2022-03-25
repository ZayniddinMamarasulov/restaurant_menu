import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:restaurant_menu/screens/dishes_page.dart';
import 'package:restaurant_menu/screens/salads_page.dart';
import '../models/lang.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }


  var _pages = [
    DishesPage(),
    SaladsPage(),
    SaladsPage(),
    SaladsPage(),
  ];

  var _langs = [
    Lang('uz', true),
    Lang('ru', false),
    Lang('en', false),
  ];

  int _activeLangIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            minWidth: 52,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            groupAlignment: 0.5,
            selectedLabelTextStyle:
                const TextStyle(color: Colors.white, fontSize: 24),
            unselectedLabelTextStyle:
                const TextStyle(color: Colors.white70, fontSize: 18),
            labelType: NavigationRailLabelType.all,
            backgroundColor: Color(0xff2A5270),
            selectedIndex: _selectedIndex,
            leading: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 120,
                ),
                ToggleButtons(
                  fillColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  selectedBorderColor: Colors.transparent,
                  selectedColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  direction: Axis.vertical,
                  children: <Widget>[
                    langButton(_langs[0]),
                    langButton(_langs[1]),
                    langButton(_langs[2]),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      _langs.forEach((e) {
                        e.isActive = false;
                      });
                      _langs[index].isActive = true;
                    });
                  },
                  isSelected: _langs.map((e) => e.isActive).toList(),
                ),
              ],
            ),
            destinations: const [
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Блюда"),
                  )),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Салаты"),
                  )),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Напитки"),
                  )),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Fast Food"),
                  )),
            ],
          ),
          Expanded(child: _pages[_selectedIndex])
        ],
      ),
    );
  }

  Widget langButton(Lang lang) {
    return Container(
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          lang.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            lang.isActive ? const Color(0xff206498) : const Color(0xff2A5270),
      ),
    );
  }
}
