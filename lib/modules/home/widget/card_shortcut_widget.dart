import 'package:Eiger/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardShortcut extends StatelessWidget {
  final String picture;
  final String label;

  const CardShortcut({Key? key, required this.picture, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: SvgPicture.asset(
                    picture,
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                this.label,
                textAlign: TextAlign.center,
                style: textSmall(color: neutral90),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
