import 'package:fixtures/core/colors.dart';
import 'package:fixtures/core/utils/date_formatter.dart';
import 'package:fixtures/model/fixture_model.dart';
import 'package:fixtures/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BettingScreen extends StatefulWidget {
  const BettingScreen({super.key, required this.fixture});
  final FixtureModel fixture;

  @override
  State<BettingScreen> createState() => _BettingScreenState();
}

class _BettingScreenState extends State<BettingScreen> {
  int? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallet.white,
        title: Text(
          "Place Bet",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.black12),

                  Container(
                    color: Color(0xffF5F8FA),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
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
                        Divider(color: Colors.black12),
                        // Match Info Section
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SvgPicture.network(
                                  widget.fixture.homeLogo,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'LVP',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Pallet.black,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  '0 - 0',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Pallet.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Starts at ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        DateFormatter.formatTimeDate(
                                          widget.fixture.date,
                                        ),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.network(
                                  widget.fixture.awayLogo,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'BVB',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Pallet.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Divider(color: Colors.black12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available Balance",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Pallet.black,
                          ),
                        ),
                        Text(
                          "BNBUSD \$129.22",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Pallet.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Selected Team
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Choose Team',
                              style: TextStyle(
                                fontSize: 14,
                                color: Pallet.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            selected == null
                                ? SizedBox()
                                : Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Selected ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      TextSpan(
                                        text:
                                            selected == 0
                                                ? widget.fixture.homeTeam
                                                : selected == 1
                                                ? "Draw"
                                                : widget.fixture.awayTeam,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Pallet.green,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " || Value2.2x",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        BettingWidget(
                          onTap: () {
                            selected = 0;
                            setState(() {});
                          },
                          isSelected: selected == 0,
                          title: "${widget.fixture.homeTeam} (2.20x)",
                        ),
                        SizedBox(height: 12),
                        BettingWidget(
                          isSelected: selected == 2,
                          onTap: () {
                            selected = 2;
                            setState(() {});
                          },
                          title: "${widget.fixture.awayTeam} (2.20x)",
                        ),
                        SizedBox(height: 12),
                        BettingWidget(
                          isSelected: selected == 1,
                          title: "Draw (2.20x)",
                          onTap: () {
                            selected = 1;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enter Amount',
                              style: TextStyle(
                                fontSize: 14,
                                color: Pallet.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Amount',
                                filled: true,
                                fillColor: Colors.grey.shade50,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildPercentageButton('10%'),
                                _buildPercentageButton('20%'),
                                _buildPercentageButton('30%'),
                                _buildPercentageButton('40%'),
                                _buildPercentageButton('50%'),
                                _buildPercentageButton('60%'),
                                _buildPercentageButton('Max'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12)),
              color: Colors.white,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: AppButton(padding: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPercentageButton(String percentage) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        percentage,
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
    );
  }
}

class BettingWidget extends StatelessWidget {
  const BettingWidget({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
  });
  final bool isSelected;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: isSelected ? Pallet.green : Colors.grey.shade50,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Pallet.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
