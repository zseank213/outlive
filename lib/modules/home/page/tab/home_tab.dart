import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _pinned = true;
  bool isProgress = false;

  int selectedIndexTipsPendakitan = 0;

  late double expandedHeight;

  List<ImageAndTitle> icons = [
    ImageAndTitle(image: "assets/images/icons/Rencana Pendakian.svg", label: "Rencana Pendakian"),
    ImageAndTitle(image: "assets/images/icons/Basic Knowledge.svg", label: "Basic Knowledge"),
    ImageAndTitle(image: "assets/images/icons/Perlengkapan Pendakian.svg", label: "Perlengkapan Pendakian"),
    ImageAndTitle(image: "assets/images/icons/Direktori Gunung.svg", label: "Direktori Gunung"),
  ];

  List<CardInfo> recommendForNewbie = [
    CardInfo(
      image: "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2020/01/30/1299509524.jpg",
      name: "Gunung Kembar",
      location: "Jawa Barat",
      high: "2.211 m",
      level: "Medium",
      time: "± 2 Hari 1 Malam",
    ),
    CardInfo(
      image: "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2020/01/30/1299509524.jpg",
      name: "Gunung Jeruk",
      location: "Jawa Barat",
      high: "2.211 m",
      level: "Medium",
      time: "± 2 Hari 1 Malam",
    ),
  ];

  TipsPendakianModel? dataTipsPendakianModel;

  Future<void> readJson() async {
    final response = await rootBundle.rootBundle.loadString('lib/dummy/tips_pendakian.json');
    setState(() {
      dataTipsPendakianModel = tipsPendakianModelFromJson(response);
      dataTipsPendakianModel?.data?[0].isActive = true;
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isProgress) {
    } else {
      expandedHeight = MediaQuery.of(context).size.height * 0.3;
    }

    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            expandedHeight: expandedHeight,
            // primary: false,
            backgroundColor: primary,
            flexibleSpace: FlexibleSpaceBar(
              title: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: textInputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Cari destinasi pendakian",
                    isFilled: true,
                    fillColor: Colors.white,
                    colorBorder: Colors.transparent,
                    enableColorBorder: primary,
                  ),
                ),
              ),
              titlePadding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: MediaQuery.of(context).padding.top),
              expandedTitleScale: 1,
              collapseMode: CollapseMode.pin,
              background: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            "assets/images/backgrounds/Home-Background.svg",
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.06,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    primary: true,
                    crossAxisCount: 4,
                    childAspectRatio: 2 / 3,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(icons.length, (index) {
                      return CardShortcut(
                        // key: shortcutKey,
                        picture: icons[index].image,
                        label: icons[index].label,
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Direkomendasikan untuk pemula",
                          style: textMedium(
                            color: neutral90,
                            isBold: true,
                          ),
                        ),
                        AppDimens.verticalSpace4,
                        Text(
                          "Cocok untuk kamu yang baru belajar naik gunung ",
                          style: textNormal(
                            color: neutral70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.verticalSpace8,
                  Container(
                    height: 204,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 204,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          recommendForNewbie[index].image ?? "",
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                          bottom: 12,
                                          left: 12,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${recommendForNewbie[index].name}",
                                                style: textMedium(
                                                  color: neutral30,
                                                  isBold: true,
                                                ),
                                              ),
                                              AppDimens.verticalSpace4,
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.pin_drop,
                                                    color: neutral30,
                                                    size: 10,
                                                  ),
                                                  AppDimens.horizontalSpace4,
                                                  Text(
                                                    "${recommendForNewbie[index].location}",
                                                    style: textButton(
                                                      color: neutral30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ketinggian",
                                              style: textButton(
                                                color: neutral70,
                                              ),
                                            ),
                                            AppDimens.verticalSpace6,
                                            Text(
                                              recommendForNewbie[index].high,
                                              style: textSmall(
                                                color: neutral80,
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: neutral70,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Kesulitan",
                                              style: textButton(
                                                color: neutral70,
                                              ),
                                            ),
                                            AppDimens.verticalSpace6,
                                            Text(
                                              recommendForNewbie[index].level,
                                              style: textSmall(
                                                color: neutral80,
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: neutral70,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Waktu tempuh",
                                              style: textButton(
                                                color: neutral70,
                                              ),
                                            ),
                                            AppDimens.verticalSpace6,
                                            Text(
                                              recommendForNewbie[index].time,
                                              style: textSmall(
                                                color: neutral80,
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
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => AppDimens.horizontalSpace8,
                      itemCount: recommendForNewbie.length,
                    ),
                  ),
                  AppDimens.verticalSpace8,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gunung Populer di Jawa Barat",
                          style: textMedium(
                            color: neutral90,
                            isBold: true,
                          ),
                        ),
                        AppDimens.verticalSpace4,
                        Text(
                          "Temukan destinasi terbaikmu",
                          style: textNormal(
                            color: neutral70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.verticalSpace8,
                  Container(
                    height: 204,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 204,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          recommendForNewbie[index].image ?? "",
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                          bottom: 12,
                                          left: 12,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${recommendForNewbie[index].name}",
                                                style: textMedium(
                                                  color: neutral30,
                                                  isBold: true,
                                                ),
                                              ),
                                              AppDimens.verticalSpace4,
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.pin_drop,
                                                    color: neutral30,
                                                    size: 10,
                                                  ),
                                                  AppDimens.horizontalSpace4,
                                                  Text(
                                                    "${recommendForNewbie[index].location}",
                                                    style: textButton(
                                                      color: neutral30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Ketinggian",
                                              style: textButton(
                                                color: neutral70,
                                              ),
                                            ),
                                            AppDimens.verticalSpace6,
                                            Text(
                                              recommendForNewbie[index].high,
                                              style: textSmall(
                                                color: neutral80,
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: neutral70,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Kesulitan",
                                              style: textButton(
                                                color: neutral70,
                                              ),
                                            ),
                                            AppDimens.verticalSpace6,
                                            Text(
                                              recommendForNewbie[index].level,
                                              style: textSmall(
                                                color: neutral80,
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: 1,
                                          color: neutral70,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Waktu tempuh",
                                              style: textButton(
                                                color: neutral70,
                                              ),
                                            ),
                                            AppDimens.verticalSpace6,
                                            Text(
                                              recommendForNewbie[index].time,
                                              style: textSmall(
                                                color: neutral80,
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
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => AppDimens.horizontalSpace8,
                      itemCount: recommendForNewbie.length,
                    ),
                  ),
                  AppDimens.verticalSpace32,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tips Pendakian",
                          style: textMedium(
                            color: neutral90,
                            isBold: true,
                          ),
                        ),
                        AppDimens.verticalSpace4,
                        Text(
                          "Disusun oleh ahli, disiapkan untuk semua kalangan",
                          style: textNormal(
                            color: neutral70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.verticalSpace8,
                  if (dataTipsPendakianModel != null)
                    Container(
                      height: 32,
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                dataTipsPendakianModel?.data?.forEach((data) {
                                  data.isActive = false;
                                });
                                selectedIndexTipsPendakitan = index;
                                if (dataTipsPendakianModel?.data?[index].isActive == true) {
                                  dataTipsPendakianModel?.data?[index].isActive = false;
                                } else {
                                  dataTipsPendakianModel?.data?[index].isActive = true;
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 1, color: dataTipsPendakianModel?.data?[index].isActive == true ? Color(0xffFED7AA) : neutral40),
                                color: dataTipsPendakianModel?.data?[index].isActive == true ? Color(0xffFFEDD5) : Colors.transparent,
                              ),
                              child: Text(
                                dataTipsPendakianModel?.data?[index].name ?? "",
                                style: textNormal(
                                  color: dataTipsPendakianModel?.data?[index].isActive == true ? primary : neutral80,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => AppDimens.horizontalSpace4,
                        itemCount: dataTipsPendakianModel?.data?.length ?? 0,
                      ),
                    ),
                  AppDimens.verticalSpace8,
                  Container(
                    height: 204,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width - 80,
                          decoration: BoxDecoration(),
                          child: Card(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      "${dataTipsPendakianModel?.data?[selectedIndexTipsPendakitan].data?[index].image}",
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${dataTipsPendakianModel?.data?[selectedIndexTipsPendakitan].data?[index].subtitle}",
                                          style: textSmall(color: neutral70),
                                        ),
                                        AppDimens.verticalSpace4,
                                        Text(
                                          "${dataTipsPendakianModel?.data?[selectedIndexTipsPendakitan].data?[index].title}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: textNormal(
                                            color: neutral90,
                                            isBold: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => AppDimens.horizontalSpace8,
                      itemCount: dataTipsPendakianModel?.data?[selectedIndexTipsPendakitan].data?.length ?? 0,
                    ),
                  ),
                  AppDimens.verticalSpace16,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: BigButtonBorder(
                      text: "Lihat semua tips",
                      onTap: () {},
                      color: neutral40,
                      textStyle: textNormal(color: primary),
                    ),
                  ),
                  AppDimens.verticalSpace40,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daerah Populer",
                          style: textMedium(
                            color: neutral90,
                            isBold: true,
                          ),
                        ),
                        AppDimens.verticalSpace4,
                        Text(
                          "Temukan destinasi pendakian berdasarkan daerah",
                          style: textNormal(
                            color: neutral70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.verticalSpace8,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageAndTitle {
  final String image;
  final String label;

  ImageAndTitle({
    required this.image,
    required this.label,
  });
}

class CardInfo {
  final String image;
  final String name;
  final String location;
  final String high;
  final String level;
  final String time;

  CardInfo({
    required this.image,
    required this.name,
    required this.location,
    required this.high,
    required this.level,
    required this.time,
  });
}
