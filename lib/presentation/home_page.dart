import 'package:flutter/material.dart';
import 'package:list_api/presentation/countries_page/countries_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
// with TickerProviderStateMixin
{
  // late TabController tabController;
  @override
  void initState() {
    // tabController = TabController(initialIndex: 0, length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);

    return
        // DefaultTabController(
        // length: 2,
        // child:
        Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Weather for Travel',
        ),
      ),
      body: const CountriesPage(),
      // TabBarView(
      //   controller: tabController,
      //   children: const [
      //     CountriesPage(),
      //     WeatherPage(),
      //   ],
      // ),
      // bottomSheet: TabBar(
      //   // navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
      //   // ? 0.0
      //   // : kBottomNavigationBarHeight,
      //   controller: tabController,
      //   onTap: (value) {
      //     setState(() {
      //       tabController.index = value;
      //     });
      //   },
      //   tabs: [
      //     Tab(
      //         icon: Icon(
      //       Icons.location_city,
      //       color: theme.cardColor,
      //     )),
      //     Tab(
      //         icon: Icon(
      //       Icons.sunny_snowing,
      //       color: theme.canvasColor,
      //     )),
      //   ],
      // ),
    );
  }
}
