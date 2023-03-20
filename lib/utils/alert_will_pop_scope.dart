import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Eiger/lib.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Apakah kamu ingin keluar dari aplikasi ?",
                  style: textNormal(
                    color: neutral80,
                  ),
                ),
                AppDimens.verticalSpace12,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          "Ya",
                          style: textNormal(
                            color: neutral30,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.red.shade800),
                      ),
                     ),
                    AppDimens.horizontalSpace12,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Tidak", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
