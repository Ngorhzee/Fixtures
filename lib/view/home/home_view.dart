import 'package:fixtures/core/colors.dart';
import 'package:fixtures/providers/fixture_provider.dart';
import 'package:fixtures/view/home/widget/fixtures_widget.dart';
import 'package:fixtures/view/home/widget/live_game_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async =>
          await Provider.of<FixtureProvider>(
            context,
            listen: false,
          ).getFixtures(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FixtureProvider provider = Provider.of<FixtureProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 100),
        child: AppBar(
          backgroundColor: Pallet.blue,
          centerTitle: false,
          title: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 24),
                  Text(
                    "Your Balance",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "BNBUSD \$192.22",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Upcoming Games",
                  style: TextStyle(
                    fontSize: 16,
                    color: Pallet.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    ...List.generate(
                      provider.fixtures.length,
                      (index) => FixturesWidget(
                        fixture: provider.fixtures[index],
                        isBetPlaced: index % 2 == 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Live Games",
                  style: TextStyle(
                    fontSize: 16,
                    color: Pallet.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    ...List.generate(
                      provider.fixtures.length,
                      (index) => LiveGameWidget(
                        fixture: provider.fixtures[index],
                        isEntered: index % 2 == 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
