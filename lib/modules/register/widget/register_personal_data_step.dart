import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterPersonalDataStep extends StatefulWidget {
  final PageController pageController;
  final ValueSetter<DataRegisterModel> callback;
  final String email;

  const RegisterPersonalDataStep({
    Key? key,
    required this.pageController,
    required this.callback,
    required this.email,
  }) : super(key: key);

  @override
  State<RegisterPersonalDataStep> createState() => _RegisterPersonalDataStepState();
}

class _RegisterPersonalDataStepState extends State<RegisterPersonalDataStep> {
  GenderRadio _genderRadio = GenderRadio.Laki;

  final TextEditingController _birthDateController = TextEditingController();

  double currentValue = 50;

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTextTitleNoElevation(
        context,
        text: "Buat akun",
        canBack: true,
        onTapLeading: () {
          if (currentValue <= 50) {
            widget.callback(
              DataRegisterModel(isFirstPage: true, email: widget.email),
            );
            widget.pageController.previousPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          } else {
            setState(() {
              currentValue -= 50;
            });
          }
        },
      ),
      body: Column(
        children: [
          FAProgressBar(
            currentValue: currentValue,
            displayText: '',
            size: 4,
            displayTextStyle: textSmall(color: Colors.transparent),
            borderRadius: BorderRadius.circular(0),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PageView(
                controller: pageController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Isi profil singkat",
                          style: textLarge(
                            color: neutral90,
                            isBold: true,
                          ),
                        ),
                        AppDimens.verticalSpace24,
                        TittleAndTextField(
                          tittle: "Nama",
                          hintText: "Masukkan nama lengkap",
                        ),
                        TittleAndTextField(
                          tittle: "Nomor HP",
                          hintText: "Masukkan nomor HP",
                        ),
                        TittleAndTextFieldPrefix(
                          tittle: "Tanggal Lahir",
                          controller: _birthDateController,
                          isDisable: true,
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: neutral70,
                          ),
                          hintText: "Masukkan tanggal lahir",
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 1, 1),
                              maxTime: DateTime.now(),
                              onConfirm: (date) {
                                // _birthDateController.text = date.day.toString() + "/" + date.month.toString() + "/" + date.year.toString();

                                if (date.month.toInt() <= 9) {
                                  setState(() {
                                    _birthDateController.text = date.year.toString() + "/" + "0" + date.month.toString() + "/" + date.day.toString();
                                  });
                                } else {
                                  setState(() {
                                    _birthDateController.text = date.year.toString() + "/" + date.month.toString() + "/" + date.day.toString();
                                  });
                                }
                              },
                              locale: LocaleType.id,
                              // currentTime: DateTime.now(),
                            );
                          },
                        ),
                        TittleAndTextField(
                          tittle: "Tempat Tinggal",
                          hintText: "Masukkan kota tempat tinggal",
                        ),
                        Text(
                          "Gender",
                          style: textMedium(color: neutral90),
                        ),
                        ListTile(
                          title: const Text('Laki-Laki'),
                          leading: Radio(
                            value: GenderRadio.Laki,
                            groupValue: _genderRadio,
                            onChanged: (value) {
                              setState(() {
                                _genderRadio = value ?? GenderRadio.Laki;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                        ),
                        ListTile(
                          title: const Text('Perempuan'),
                          leading: Radio(
                            value: GenderRadio.Perempuan,
                            groupValue: _genderRadio,
                            onChanged: (value) {
                              setState(() {
                                _genderRadio = value ?? GenderRadio.Perempuan;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: BigButton(
            text: currentValue == 50 ? "Lanjutkan" : "Buat Akun Baru",
            onTap: () {
              if (currentValue < 100) {
                setState(() {
                  currentValue += 50;
                });
              } else {
                print("CREATE");
              }
            },
            textStyle: textMedium(color: neutral30),
          ),
        ),
      ),
    );
  }
}

enum GenderRadio { Laki, Perempuan }
