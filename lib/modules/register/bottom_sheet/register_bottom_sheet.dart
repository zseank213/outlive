import 'package:Eiger/modules/register/widget/register_success_step.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({Key? key}) : super(key: key);

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  final TextEditingController _emailController = TextEditingController();
  final PageController pageController = PageController(initialPage: 0);

  bool isPassword = true;
  bool isFirstPage = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          RegisterEmailStep(
            pageController: pageController,
            callback: (value) {
              setState(() {
                isFirstPage = false;
                // if (value.email != "") {
                //   _emailController.text = value.email ?? "";
                // }
              });
            },
          ),
          RegisterPersonalDataStep(
            pageController: pageController,
            callback: (DataRegisterModel value) {
              setState(() {
                isFirstPage = value.isFirstPage ?? true;
              });
            },
            email: _emailController.text,
          ),
          RegisterSuccessStep(
            pageController: pageController,
          ),
          RegisterQuizStep(
            pageController: pageController,
          ),
        ],
      ),
      bottomNavigationBar: isFirstPage
          ? BottomAppBar(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Sudah punya akun? ',
                    style: textNormal(color: neutral70),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Masuk disini',
                        style: textNormal(color: primary, isUnderline: true),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                            showLoginBottomSheet(context);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
