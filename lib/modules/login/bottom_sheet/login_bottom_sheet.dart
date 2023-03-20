import 'package:Eiger/modules/register/widget/register_bottom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({Key? key}) : super(key: key);

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.clear),
              ),
            ),
            Column(
              children: [
                AppDimens.verticalSpace24,
                Center(
                  child: SvgPicture.asset(
                    "assets/images/icons/Logotype Horizontal.svg",
                  ),
                ),
                AppDimens.verticalSpace12,
                Text(
                  "Masukkan akun Outlive Kamu",
                  style: textMedium(color: neutral70),
                ),
                AppDimens.verticalSpace20,
                TittleAndTextField(
                  tittle: "Email",
                  controller: _emailController,
                  borderColor: neutral40,
                  hintText: "Masukkan email",
                  isEmail: true,
                ),
                TittleAndTextFieldSuffix(
                  tittle: "Password",
                  controller: _passwordController,
                  isPassword: isPassword,
                  suffixIcon: InkWell(
                    onTap: () {
                      if (isPassword) {
                        setState(() {
                          isPassword = false;
                        });
                      } else {
                        setState(() {
                          isPassword = true;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: isPassword ? neutral70 : primary,
                    ),
                  ),
                  borderColor: neutral40,
                  hintText: "Masukkan password",
                ),
                AppDimens.verticalSpace8,
                BigButton(
                  text: "Masuk",
                  onTap: () {},
                  textStyle: textMedium(color: neutral30, isBold: true),
                ),
                AppDimens.verticalSpace16,
                Text(
                  "Lupa Password",
                  style: textNormal(color: neutral90, isUnderline: true),
                ),
                AppDimens.verticalSpace24,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: neutral50,
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "atau",
                        style: textSmall(color: neutral60),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: neutral50,
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                AppDimens.verticalSpace24,
                BigButton(
                  text: "Continue in with Google",
                  onTap: () {},
                  color: neutral30,
                  icon: SvgPicture.asset(
                    "assets/images/icons/Google.svg",
                  ),
                  textStyle: textMedium(
                    color: neutral90,
                    isBold: true,
                  ),
                ),
                AppDimens.verticalSpace12,
                BigButton(
                  text: "Continue in with Facebook",
                  onTap: () {},
                  color: neutral30,
                  icon: SvgPicture.asset(
                    "assets/images/icons/Facebook.svg",
                  ),
                  textStyle: textMedium(
                    color: neutral90,
                    isBold: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Belum punya akun? ',
              style: textNormal(color: neutral70),
              children: <TextSpan>[
                TextSpan(
                  text: 'Daftar disini',
                  style: textNormal(color: primary, isUnderline: true),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                      showRegisterBottomSheet(context);
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
