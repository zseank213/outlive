import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter_svg/svg.dart';

class RegisterEmailStep extends StatefulWidget {
  final PageController pageController;
  final ValueSetter<DataRegisterModel> callback;

  const RegisterEmailStep({
    Key? key,
    required this.pageController,
    required this.callback,
  }) : super(key: key);

  @override
  State<RegisterEmailStep> createState() => _RegisterEmailStepState();
}

class _RegisterEmailStepState extends State<RegisterEmailStep> {
  final TextEditingController _emailController = TextEditingController();

  bool isPassword = true;
  bool isFirstPage = true;

  final _formEmailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formEmailKey,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
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
                  "Buat akun baru di Outlive",
                  style: textMedium(color: neutral70),
                ),
                AppDimens.verticalSpace20,
                TittleAndTextField(
                  tittle: "Email",
                  controller: _emailController,
                  borderColor: neutral40,
                  hintText: "Masukkan email",
                  isEmail: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email Wajib Diisi!";
                    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                      return "Email Tidak Valid !";
                    }
                  },
                ),
                BigButton(
                  text: "Buat Akun",
                  onTap: () {
                    if (_formEmailKey.currentState!.validate()) {
                      setState(() {
                        isFirstPage = false;
                        widget.callback(
                          DataRegisterModel(email: _emailController.text),
                        );
                      });
                      widget.pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  textStyle: textMedium(color: neutral30, isBold: true),
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
                AppDimens.verticalSpace24,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Dengan membuat akun, saya  setuju dengan',
                    style: textSmall(color: neutral60),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' syarat ketentuan',
                        style: textSmall(color: neutral90),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("syarat ketentuan");
                          },
                      ),
                      TextSpan(
                        text: ' dan',
                        style: textSmall(color: neutral70),
                      ),
                      TextSpan(
                        text: ' kebijakan privasi.',
                        style: textSmall(color: neutral90),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("kebijakan privasi");
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
