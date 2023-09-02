import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_icons.dart';
import 'custom_notch.dart';
import 'icon_builder.dart';
import 'inherited_widget.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of(context);
    final size = MediaQuery.sizeOf(context);

    return BottomAppBar(
      color: AppColor.mainColor,
      height: 90,
      shape: const CustomNotch(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      notchMargin: 20,
      padding: const EdgeInsets.only(top: 1),
      child: BottomAppBar(
        color: Colors.white,
        height: 90,
        shape: const CustomNotch(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        notchMargin: 20,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ValueListenableBuilder(
                  valueListenable: dataProvider.isTimerStarted,
                  builder: (context, _, child) {
                    return ValueListenableBuilder(
                      valueListenable: dataProvider.isSettings,
                      builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconBuilder(
                            icon: value
                                ? AppIcons.homeOutlinedIcon
                                : AppIcons.homeFilledIcon,
                            opacityValue: value ? 0.0 : 1.0,
                            onPressed: dataProvider.bottomPressed(false),
                          ),
                          SizedBox(width: size.width > 360 ? 40 : 20),
                          IconBuilder(
                            icon: value
                                ? AppIcons.settingFilledIcon
                                : AppIcons.settingsOutlinedIcon,
                            opacityValue: value ? 1.0 : 0.0,
                            onPressed: dataProvider.bottomPressed(true),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
