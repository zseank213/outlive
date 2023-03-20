import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

class CircleTabBarWidget extends StatefulWidget {
  final TabController controller;
  final int controllerLength;
  final double size;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  const CircleTabBarWidget({
    Key? key,
    required this.controller,
    required this.controllerLength,
    required this.size,
    this.labelColor,
    this.unselectedLabelColor,
  }) : super(key: key);

  @override
  State<CircleTabBarWidget> createState() => _CircleTabBarWidgetState();
}

class _CircleTabBarWidgetState extends State<CircleTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TabBar(
          onTap: (index) {},
          unselectedLabelColor: widget.unselectedLabelColor ?? neutral40,
          labelColor: widget.labelColor ?? primary,
          labelPadding: EdgeInsets.all(4),
          indicatorColor: Colors.transparent,
          isScrollable: true,
          physics: NeverScrollableScrollPhysics(),
          controller: widget.controller,
          tabs: List.generate(
            widget.controllerLength,
            (index) => InkWell(
              onTap: () {},
              child: Tab(
                icon: Icon(
                  Icons.circle_rounded,
                  size: widget.size,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
