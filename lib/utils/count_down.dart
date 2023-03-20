// import 'dart:async';
// import 'package:Eiger/lib.dart';
//
// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:ntp/ntp.dart';
//
// extension DurationExtension on Duration {
//   String toHourMinuteSecond() {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
//     final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
//     return '${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
//   }
//
//   String toHourMinute() {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
//     return '${twoDigits(inHours)}:$twoDigitMinutes';
//   }
// }
//
// //Expire Time
// class TickExpireDuration extends StatefulWidget {
//   const TickExpireDuration({
//     Key? key,
//     required this.startTime,
//     required this.expireTime,
//     this.onFinish,
//     this.textStyle,
//   }) : super(key: key);
//
//   final DateTime expireTime;
//   final DateTime startTime;
//   final TextStyle? textStyle;
//   final void Function()? onFinish;
//
//   @override
//   _TickExpireDurationState createState() => _TickExpireDurationState();
// }
//
// class _TickExpireDurationState extends State<TickExpireDuration> {
//   late Timer? timer;
//
//   Future<void> timing() async {
//     DateTime startDate = await NTP.now();
//     timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       final expireDuration = widget.expireTime.difference(startDate);
//       if (!expireDuration.isNegative) {
//         setState(() {});
//       } else {
//         widget.onFinish?.call();
//         timer?.cancel();
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     timing();
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final expireDuration = widget.expireTime.difference(DateTime.now());
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: primary,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: Text(
//                   expireDuration.isNegative ? '-' : expireDuration.toHourMinuteSecond().substring(0, 3).replaceAll(":", ""),
//                   style: widget.textStyle,
//                   maxLines: 1,
//                 ),
//               ),
//             ),
//             AppDimens.verticalSpace8,
//             Text(
//               "Hour".tr,
//               style: textSmall(
//                 color: neutral90,
//               ),
//             ),
//           ],
//         ),
//         AppDimens.horizontalSpace30,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: primary,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: Text(
//                   expireDuration.isNegative ? '-' : expireDuration.toHourMinuteSecond().substring(3, 5).replaceAll(":", ""),
//                   style: widget.textStyle,
//                   maxLines: 1,
//                 ),
//               ),
//             ),
//             AppDimens.verticalSpace6,
//             Text(
//               "Minute".tr,
//               style: textSmall(
//                 color: neutral90,
//               ),
//             ),
//           ],
//         ),
//         AppDimens.horizontalSpace30,
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 60,
//               height: 60,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: primary,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: Text(
//                   expireDuration.isNegative ? '-' : expireDuration.toHourMinuteSecond().substring(5).replaceAll(":", ""),
//                   style: widget.textStyle,
//                   maxLines: 1,
//                 ),
//               ),
//             ),
//             AppDimens.verticalSpace6,
//             Text(
//               "Seconds".tr,
//               style: textSmall(
//                 color: neutral90,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class Countdown extends AnimatedWidget {
//   final bool isClicked;
//   final bool finish;
//   Countdown({
//     Key? key,
//     required this.animation,
//     required this.isClicked,
//     required this.finish,
//   }) : super(key: key, listenable: animation);
//   Animation<int> animation;
//
//   @override
//   build(BuildContext context) {
//     Duration clockTimer = Duration(seconds: animation.value);
//
//     String timerText = '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
//
//     return finish
//         ? const Text("")
//         : Text(
//             " ($timerText)",
//             style: textSmall(
//               color: neutral70,
//             ),
//           );
//   }
// }
//
// class TickExpireDurationText extends StatefulWidget {
//   final DateTime expireTime;
//   final DateTime startTime;
//   final TextStyle? textStyle;
//   final void Function()? onFinish;
//
//   const TickExpireDurationText({
//     Key? key,
//     required this.startTime,
//     required this.expireTime,
//     this.onFinish,
//     this.textStyle,
//   }) : super(key: key);
//
//   @override
//   State<TickExpireDurationText> createState() => _TickExpireDurationTextState();
// }
//
// class _TickExpireDurationTextState extends State<TickExpireDurationText> {
//   late Timer? timer;
//
//   Future<void> timing() async {
//     DateTime startDate = await NTP.now();
//     timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       final expireDuration = widget.expireTime.difference(startDate);
//       if (!expireDuration.isNegative) {
//         setState(() {});
//       } else {
//         widget.onFinish?.call();
//         timer?.cancel();
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     timing();
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final expireDuration = widget.expireTime.difference(DateTime.now());
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               expireDuration.isNegative ? '-' : expireDuration.toHourMinuteSecond().substring(0, 3).replaceAll(":", ""),
//               style: widget.textStyle,
//               maxLines: 1,
//             ),
//             Text(
//               "h".tr,
//               style: textSmall(
//                 color: neutral90,
//               ),
//             ),
//           ],
//         ),
//         AppDimens.horizontalSpace4,
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               expireDuration.isNegative ? '-' : expireDuration.toHourMinuteSecond().substring(3, 5).replaceAll(":", ""),
//               style: widget.textStyle,
//               maxLines: 1,
//             ),
//             Text(
//               "m".tr,
//               style: textSmall(
//                 color: neutral90,
//               ),
//             ),
//           ],
//         ),
//         AppDimens.horizontalSpace4,
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               expireDuration.isNegative ? '-' : expireDuration.toHourMinuteSecond().substring(5).replaceAll(":", ""),
//               style: widget.textStyle,
//               maxLines: 1,
//             ),
//             Text(
//               "s".tr,
//               style: textSmall(
//                 color: neutral90,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
