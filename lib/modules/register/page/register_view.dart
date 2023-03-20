import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 4,
              decoration: BoxDecoration(
                color: neutral70,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: RegisterBottomSheet(),
        ),
      ],
    );
  }
}
