import 'package:fixtures/core/colors.dart';
import 'package:fixtures/core/utils/date_formatter.dart';
import 'package:fixtures/model/fixture_model.dart';
import 'package:fixtures/view/home/place_bet_screen.dart';
import 'package:fixtures/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FixturesWidget extends StatelessWidget {
  const FixturesWidget({super.key, required this.fixture, required this.isBetPlaced});
  final FixtureModel fixture;
  final bool isBetPlaced;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 285),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 0,
            color: Pallet.black.withOpacity(.08),
            // offset: Offset(6, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Pallet.black,
            ),
            child: Row(
              children: [
                Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  "Starts at ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  DateFormatter.formatTimeDate(fixture.date),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 52,
                      child: Stack(
                        children: [
                          SvgPicture.network(
                            fixture.homeLogo,
                            height: 30,
                            width: 30,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            left: 24,
                            child: SvgPicture.network(
                              fixture.awayLogo,
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: fixture.homeName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Pallet.black,
                            ),
                          ),
                          TextSpan(
                            text: "vs",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Pallet.black,
                            ),
                          ),
                          TextSpan(
                            text: fixture.awayName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Pallet.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Round 16",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: BetWidget(title: fixture.homeName, value: "2.20x"),
                    ),
                    SizedBox(width: 12),
                    Expanded(child: BetWidget(title: "DRAW", value: "2.20x")),
                    SizedBox(width: 12),
                    Expanded(
                      child: BetWidget(title: fixture.awayName, value: "2.20x"),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(color: Colors.grey),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prize poll",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Pallet.black,
                      ),
                    ),
                    Text(
                      "400.35 BNB",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Pallet.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(color: Colors.grey),
                SizedBox(height: 12),
                AppButton(
                  bgColor:  isBetPlaced?Pallet.greenAccent:null,
                  title: isBetPlaced?"You Place on ${fixture.homeName}":null,
                  onTap:isBetPlaced?(){}:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (route) => BettingScreen(fixture: fixture),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BetWidget extends StatelessWidget {
  const BetWidget({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade50,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
