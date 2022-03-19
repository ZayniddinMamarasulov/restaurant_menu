import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:restaurant_menu/screens/details_page.dart';
import 'package:restaurant_menu/screens/dishes_page.dart';
import 'package:restaurant_menu/screens/salads_page.dart';

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

  List<Widget> _pages = [
    DishesPage(),
    SaladsPage(),
    SaladsPage(),
    SaladsPage(),
  ];

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

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => DetailsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }
}
