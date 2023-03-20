import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

class TitleAndSwitch extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final void Function(bool)? onChange;
  final bool value;

  TitleAndSwitch({
    Key? key,
    required this.title,
    required this.onChange,
    this.titleStyle,
    required this.value,
  }) : super(key: key);

  @override
  State<TitleAndSwitch> createState() => _TitleAndSwitchState();
}

class _TitleAndSwitchState extends State<TitleAndSwitch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: widget.titleStyle,
            ),
            Row(
              children: [
                Switch(
                  value: widget.value,
                  onChanged: widget.onChange,
                ),
                Text(
                  widget.value == true ? "On" : "Off",
                ),
              ],
            ),
          ],
        ),
        AppDimens.verticalSpace12,
      ],
    );
  }
}
