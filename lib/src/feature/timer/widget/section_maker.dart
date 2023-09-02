import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import 'custom_button.dart';
import 'inherited_widget.dart';

class SectionMaker extends StatelessWidget {
  const SectionMaker({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of(context);
    final size = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dataProvider.data
              .map(
                (e) => ValueListenableBuilder(
                  valueListenable: dataProvider.isTimerStarted,
                  builder: (context,_,child) {
                    return ValueListenableBuilder(
                      valueListenable: dataProvider.pageCount,
                      builder: (context, value, child) => Buttons(
                        item: e,
                        page: value,
                        onPressed: dataProvider.onSectionChanged,
                      ),
                    );
                  }
                ),
              )
              .toList(),
        ),
        Center(
          child: SizedBox(
            width: size.width > 360 ? 250 : 215,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: SizedBox(
                height: 6,
                width: double.infinity,
                child: ColoredBox(
                  color: AppColor.restartIconBGColor,
                  child: ValueListenableBuilder(
                    valueListenable: dataProvider.pageCount,
                    builder: (context, value, child) {
                      return AnimatedAlign(
                        alignment: switch (dataProvider.pageCount.value) {
                          1 => Alignment.center,
                          2 => Alignment.centerRight,
                          _ => Alignment.centerLeft,
                        },
                        duration: const Duration(milliseconds: 200),
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: SizedBox(
                            height: 6,
                            width: 55,
                            child: ColoredBox(
                              color: AppColor.mainColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
