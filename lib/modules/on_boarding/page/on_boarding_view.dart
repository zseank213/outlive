import 'package:Eiger/modules/register/widget/register_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int indexPage = 0;
  final pageController = PageController();
  final pageSecondController = PageController();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pageSecondController.addListener(() {
      if (pageSecondController.position.atEdge) {
        bool isTop = pageSecondController.position.pixels == 0;
        if (isTop) {
          print("top");
        } else {
          print("Bottom");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      controller: pageSecondController,
      onPageChanged: (page) {
        Navigator.pushReplacementNamed(context, routeHome);
      },
      // physics: pageSecondController.page == 1 ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  child: PageView(
                    onPageChanged: (index) {
                      setState(() {
                        indexPage = index;
                      });
                    },
                    controller: pageController,
                    physics: ClampingScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    "assets/images/backgrounds/Background-OnBoarding1.svg",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/icons/OnBoarding1.svg",
                                      width: MediaQuery.of(context).size.width - 60,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Akses informasi pendakian gunung yang lengkap",
                                        style: textExtraLarge(
                                          color: neutral90,
                                          isBold: true,
                                        ),
                                      ),
                                      AppDimens.verticalSpace12,
                                      Text(
                                        "Temukan informasi landscape gunung, daya tarik alam, dan akses pendakiannya",
                                        style: textNormal(
                                          color: neutral80,
                                        ),
                                      ),
                                      AppDimens.verticalSpace20,
                                      BigButton(
                                        text: "Login",
                                        onTap: () {
                                          showLoginBottomSheet(context);
                                        },
                                        textStyle: textNormal(
                                          color: neutral30,
                                          isBold: true,
                                        ),
                                      ),
                                      AppDimens.verticalSpace12,
                                      BigButtonBorder(
                                        text: "Daftar",
                                        onTap: () {
                                          showRegisterBottomSheet(context);
                                        },
                                        color: greyPrimary,
                                        textStyle: textNormal(
                                          color: primary,
                                          isBold: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    "assets/images/backgrounds/Background-OnBoarding2.svg",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/icons/OnBoarding2.svg",
                                      width: MediaQuery.of(context).size.width - 60,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pendakian gunung yang lebih terencana",
                                        style: textExtraLarge(
                                          color: neutral90,
                                          isBold: true,
                                        ),
                                      ),
                                      AppDimens.verticalSpace12,
                                      Text(
                                        "Buat jalur pendakian berdasarkan rute, durasi, dan aktivitas yang diinginkan",
                                        style: textNormal(
                                          color: neutral80,
                                        ),
                                      ),
                                      AppDimens.verticalSpace20,
                                      BigButton(
                                        text: "Login",
                                        onTap: () {
                                          showLoginBottomSheet(context);
                                        },
                                        textStyle: textNormal(
                                          color: neutral30,
                                          isBold: true,
                                        ),
                                      ),
                                      AppDimens.verticalSpace12,
                                      BigButtonBorder(
                                        text: "Daftar",
                                        onTap: () {
                                          showRegisterBottomSheet(context);
                                        },
                                        color: greyPrimary,
                                        textStyle: textNormal(
                                          color: primary,
                                          isBold: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    "assets/images/backgrounds/Background-OnBoarding3.svg",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/icons/OnBoarding3.svg",
                                      width: MediaQuery.of(context).size.width - 60,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rekomendasi perlengkapan mendaki yang aman",
                                        style: textExtraLarge(
                                          color: neutral90,
                                          isBold: true,
                                        ),
                                      ),
                                      AppDimens.verticalSpace12,
                                      Text(
                                        "Siapkan perlengkapan dengan rekomendasi produk terbaik yang sesuai kebutuhan",
                                        style: textNormal(
                                          color: neutral80,
                                        ),
                                      ),
                                      AppDimens.verticalSpace20,
                                      BigButton(
                                        text: "Login",
                                        onTap: () {
                                          showLoginBottomSheet(context);
                                        },
                                        textStyle: textNormal(
                                          color: neutral30,
                                          isBold: true,
                                        ),
                                      ),
                                      AppDimens.verticalSpace12,
                                      BigButtonBorder(
                                        text: "Daftar",
                                        onTap: () {
                                          showRegisterBottomSheet(context);
                                        },
                                        color: greyPrimary,
                                        textStyle: textNormal(
                                          color: primary,
                                          isBold: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 16,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: primary,
                    dotColor: greyPrimary,
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_down,
                    color: neutral70,
                    size: 16,
                  ),
                  AppDimens.horizontalSpace4,
                  Text(
                    "Scroll untuk lihat lihat dulu",
                    style: textSmall(
                      color: neutral70,
                      isUnderline: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
        ),
      ],
    );
  }
}
