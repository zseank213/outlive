import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter/services.dart' as rootBundle;

class RegisterQuizStep extends StatefulWidget {
  final PageController pageController;

  const RegisterQuizStep({Key? key, required this.pageController}) : super(key: key);

  @override
  State<RegisterQuizStep> createState() => _RegisterQuizStepState();
}

class _RegisterQuizStepState extends State<RegisterQuizStep> {
  final PageController pageController = PageController(initialPage: 0);

  bool isChange = false;

  late QuizStepTwoModel _dataQuizStepTwoModel;
  late QuizStepOneModel _dataQuizStepOneModel;

  Future<void> readJson() async {
    final responseQuizStepOne = await rootBundle.rootBundle.loadString('lib/dummy/quiz_step.json');
    final responseQuizStepTwo = await rootBundle.rootBundle.loadString('lib/dummy/quiz_step_two.json');

    setState(() {
      _dataQuizStepTwoModel = quizStepTwoModelFromJson(responseQuizStepTwo);
      _dataQuizStepOneModel = quizStepOneModelFromJson(responseQuizStepOne);
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarTextTitleNoElevation(
        context,
        text: "Buat Akun",
        canBack: true,
        onTapLeading: () {
          widget.pageController.previousPage(duration: Duration(milliseconds: 250), curve: Curves.easeIn);
        },
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seberapa sering kamu naik gunung?",
                  style: textMedium(color: neutral90, isBold: true),
                ),
                AppDimens.verticalSpace24,
                ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _dataQuizStepOneModel.data?.option?.forEach((data) {
                          setState(() {
                            data.isActive = false;
                          });
                        });
                        if (_dataQuizStepOneModel.data?.option?[index].isActive == false) {
                          setState(() {
                            _dataQuizStepOneModel.data?.option?[index].isActive = true;
                          });
                        } else {
                          setState(() {
                            _dataQuizStepOneModel.data?.option?[index].isActive = false;
                          });
                        }
                      },
                      child: Container(
                        height: 52,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(width: _dataQuizStepOneModel.data?.option?[index].isActive == true ? 1 : 0.5, color: _dataQuizStepOneModel.data?.option?[index].isActive == true ? primary : neutral70),
                          borderRadius: BorderRadius.circular(8),
                          color: _dataQuizStepOneModel.data?.option?[index].isActive == true ? secondaryPrimary : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _dataQuizStepOneModel.data?.option?[index].data ?? "",
                                style: textNormal(color: _dataQuizStepOneModel.data?.option?[index].isActive == true ? primary : neutral80),
                              ),
                            ),
                            if (_dataQuizStepOneModel.data?.option?[index].isActive == true) ...[
                              Icon(
                                Icons.check_circle_rounded,
                                color: primary,
                              )
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => AppDimens.verticalSpace12,
                  itemCount: _dataQuizStepOneModel.data?.option?.length ?? 0,
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(_dataQuizStepTwoModel.data?[index].tittle ?? ""),
                  ],
                );
              },
              separatorBuilder: (context, index) => AppDimens.verticalSpace12,
              itemCount: _dataQuizStepTwoModel.data?.length ?? 0,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BigButton(
          text: "Lanjut",
          isChange: isChange,
          onTap: () {
            if (pageController.page == 0) {

            }
          },
          textStyle: textNormal(color: neutral30, isBold: true),
        ),
      ),
    );
  }
}
