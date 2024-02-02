import 'package:flutter/material.dart';
import 'package:list_api/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather for Travel',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    color: theme.cardColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          width: MediaQuery.of(context).size.width / 3 - 10,
                          child: Text(
                            'Great Britain',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.scaffoldBackgroundColor,
                            // borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                width: 5,
                                color: theme.cardColor,
                                strokeAlign: BorderSide.strokeAlignOutside),
                            image: DecorationImage(
                              image: Image.asset('assets/images/liberty100.png')
                                  .image,
                            ),
                          ),
                          height: 100,
                          width: MediaQuery.of(context).size.width / 3 - 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3 - 10,
                          child: Text(
                            'London, Birmingham, Manchester, Glasgow, Newcastle, Sheffield, Leeds, Bristol',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ));
              }),
        ),
        bottomSheet: TabBar(
          controller: tabController,
          onTap: (value) {
            setState(() {
              tabController.index = value;
            });
          },
          tabs: [
            Tab(
                icon: Icon(
              // Icons.business_outlined,
              Icons.location_city,
              color: theme.cardColor,
            )),
            Tab(
                icon: Icon(
              Icons.sunny_snowing,
              color: theme.canvasColor,
            )),
          ],
        ),
      ),
    );
  }
}
