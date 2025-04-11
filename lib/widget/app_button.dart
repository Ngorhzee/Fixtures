import 'package:fixtures/core/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key, this.onTap, this.title, this.bgColor, this.padding,
    
  });

  final Function()? onTap;
  final String? title;
  final Color? bgColor;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
        
      child: Container(
        padding: EdgeInsets.symmetric(vertical:padding?? 12),
        color: bgColor?? Pallet.blueAccent,
        child: Center(
          child: Text(
           title?? "Place Bet",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}