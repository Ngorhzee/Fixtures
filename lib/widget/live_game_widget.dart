import 'package:fixtures/core/colors.dart';
import 'package:fixtures/model/fixture_model.dart';
import 'package:fixtures/view/home/place_bet_screen.dart';
import 'package:fixtures/widget/fixtures_widget.dart';
import 'package:fixtures/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LiveGameWidget extends StatelessWidget {
  const LiveGameWidget({
    super.key,
    required this.fixture,
    required this.isEntered,
  });
  final FixtureModel fixture;
  final bool isEntered;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 285,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 285),
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 0,
                  color: Pallet.black.withOpacity(.08),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live and Round header
                Row(
                  children: [
                    Container(
                      height: 6,
                      width: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Live",
                      style: TextStyle(
                        fontSize: 14,
                        color: Pallet.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Round 16",
                      style: TextStyle(
                        fontSize: 14,
                        color: Pallet.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Teams and score
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.network(
                          fixture.homeLogo,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          fixture.homeName,
                          style: TextStyle(
                            fontSize: 16,
                            color: Pallet.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "0 - 1",
                          style: TextStyle(
                            fontSize: 18,
                            color: Pallet.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "45:00",
                            style: TextStyle(
                              fontSize: 14,
                              color: Pallet.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.network(
                          fixture.awayLogo,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          fixture.awayName,
                          style: TextStyle(
                            fontSize: 16,
                            color: Pallet.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Prize pool
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Prize pool",
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
                          color: Pallet.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Bet options
                Row(
                  children: [
                    Expanded(
                      child: BetWidget(title: fixture.homeName, value: "2.20x"),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: BetWidget(title: "DRAW", value: "2.20x")),
                    const SizedBox(width: 8),
                    Expanded(
                      child: BetWidget(title: fixture.awayName, value: "2.20x"),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                AppButton(
                  bgColor: !isEntered ? Pallet.greenAccent : null,
                  title: !isEntered ? "You Place on ${fixture.homeName}" : null,
                  onTap:
                      !isEntered
                          ? () {}
                          : () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (route) => BettingScreen(fixture: fixture),
                            ),
                          ),
                ),

                // Place Bet button
              ],
            ),
          ),

          // Entered badge
          !isEntered
              ? SizedBox()
              : Positioned(
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Pallet.greenAccent,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Entered",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
