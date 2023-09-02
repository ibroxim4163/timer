
import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../models/timer_data.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    required this.page,
    required this.item,
    required this.onPressed,
    super.key, 
  });

  final int page;
  final TimerData item;
  final void Function()? Function(int, int) onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
          AppColor.transparent,
        ),
      ),
      onPressed: onPressed(page, item.id),
      child: (page == item.id)
          ? Text(
              item.sectionName,
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: size.width > 360 ? 20 : 14,
              ),
            )
          : Text(
              item.sectionName,
              style: TextStyle(
                fontSize: size.width > 360 ? 14 : 10,
              ),
            ),
    );
  }
}
