import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import 'custom_indicator.dart';
import 'inherited_widget.dart';

class CustomTimerView extends StatelessWidget {
  const CustomTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final dataProvider = Provider.of(context, false);

    return Center(
      child: PageView(
        restorationId: 'timer_view_restoration_id',
        controller: dataProvider.timerPageController,
        physics: const NeverScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        children: dataProvider.data
            .map<Widget>(
              (e) => Align(
                alignment: Alignment.center,
                child: SizedBox.square(
                  dimension: size.height * 0.33,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColor.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox.square(
                      dimension: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ValueListenableBuilder(
                          valueListenable: dataProvider.indicatorValue,
                          builder: (context, value, child) {
                            return CustomIndicator(
                              value: value,
                              width: 10,
                              child: Center(
                                child: Text(
                                  "${((e.selectedTime.value / 1000).ceil() ~/ 60).toString().padLeft(2, "0")}"
                                  ":"
                                  "${((e.selectedTime.value / 1000).ceil() % 60).toString().padLeft(2, "0")}",
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 30,
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
            )
            .toList(),
      ),
    );
  }
}
