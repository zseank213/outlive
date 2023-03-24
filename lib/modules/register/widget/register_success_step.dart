import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterSuccessStep extends StatefulWidget {
  final PageController pageController;

  const RegisterSuccessStep({Key? key, required this.pageController}) : super(key: key);

  @override
  State<RegisterSuccessStep> createState() => _RegisterSuccessStepState();
}

class _RegisterSuccessStepState extends State<RegisterSuccessStep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BigButton(
          text: "Lanjut",
          onTap: () {
            widget.pageController.nextPage(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeIn,
            );
          },
          textStyle: textNormal(color: neutral30, isBold: true),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/icons/CheckIcon.svg",
            ),
            AppDimens.verticalSpace12,
            Text(
              "Akun berhasil dibuat",
              style: textExtraLarge(
                color: neutral90,
                isBold: true,
              ),
            ),
            AppDimens.verticalSpace12,
            Text(
              "Sekarang kamu dapat menggunakan fitur outlive.",
              style: textNormal(
                color: neutral90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
