import 'package:Eiger/lib.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginCubit _login = LoginCubit();

  @override
  void initState() {
    super.initState();
  }

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
          child: LoginBottomSheet(),
        ),
      ],
    );
  }
}
