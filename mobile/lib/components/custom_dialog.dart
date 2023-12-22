import 'package:flutter/material.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/themes/app_textstyle.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String desc;
  const CustomDialog({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: AppColor.primaryTextColor,
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(title, style: AppTextStyle.instance.diaLogStyle),
            const SizedBox(height: 8),
            Text(
              desc.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColor.blackBackground1Color,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.primaryColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Container(
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.blackBackground1Color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
