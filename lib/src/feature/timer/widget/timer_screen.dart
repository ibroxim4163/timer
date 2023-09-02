import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_icons.dart';

import 'custom_appbar.dart';
import 'custom_bottom_appbar.dart';
import 'custom_fab_location.dart';
import 'custom_timer.dart';
import 'inherited_widget.dart';
import 'section_maker.dart';
import 'setting_page.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  void dispose() {
    final dataProvider = Provider.of(context, false);
    dataProvider.timerPageController.dispose();
    dataProvider.timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of(context, false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: CustomAppBar(),
            ),
            Expanded(
              flex: 4,
              child: ValueListenableBuilder(
                valueListenable: dataProvider.isSettings,
                builder: (context, value, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: value
                        ? const SettingPage()
                        : ValueListenableBuilder(
                            valueListenable: dataProvider.isTimerStarted,
                            builder: (context, value, child) {
                              return const Column(
                                children: [
                                  Expanded(
                                    child: CustomTimerView(),
                                  ),
                                  Expanded(
                                    child: SectionMaker(
                                     
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox.square(
        dimension: 75,
        child: ValueListenableBuilder(
          valueListenable: dataProvider.isTimerStarted,
          builder: (context, _, child) {
            return ValueListenableBuilder(
              valueListenable: dataProvider.isSettings,
              builder: (context, value, child) {
                return FloatingActionButton(
                  onPressed: dataProvider.fABPressed(),
                  backgroundColor: AppColor.mainColor,
                  shape: const CircleBorder(),
                  child: Image(
                    image: AssetImage(
                      value ? AppIcons.tickIcon : AppIcons.playIcon,
                    ),
                    height: 30,
                    width: 30,
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: const CustomFABLocation(),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
