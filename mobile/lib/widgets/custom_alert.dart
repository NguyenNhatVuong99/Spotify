import 'package:flutter/material.dart';
import 'package:mobile/widgets/custom_elevated_button.dart';

class CustomAlert {
  final BuildContext context;
  final String desc;

  CustomAlert({required this.context, required this.desc});

  void show() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Đặt màu nền thành màu trắng
          content: Text(desc),
          actions: [
            CustomElevatedButton(
              // Truyền thuộc tính cần thiết nếu có
              text: "OK",
              onPressed: () => Navigator.pop(context),
              width: 100,
            )
          ],
        );
      },
    );
  }
}
