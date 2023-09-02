import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../models/timer_data.dart';

class MinuteAdder extends StatefulWidget {
  const MinuteAdder(this.item, {super.key});

  final TimerData item;

  @override
  State<MinuteAdder> createState() => _MinuteAdderState();
}

class _MinuteAdderState extends State<MinuteAdder> {
  Timer? timer;

  void onTapDownDecrement(TapDownDetails details) {
    if (widget.item.selectedTime.value > 60000) {
      widget.item.selectedTime.value -= 60000;
    }

    timer = Timer.periodic(
      const Duration(milliseconds: 200),
      (t) {
        if (widget.item.selectedTime.value > 60000) {
          widget.item.selectedTime.value -= 60000;
        }
      },
    );
  }

  void onTapDownIncrement(TapDownDetails details) {
    if (widget.item.selectedTime.value < 3600000) {
      widget.item.selectedTime.value += 60000;
    }

    timer = Timer.periodic(
      const Duration(milliseconds: 200),
      (t) {
        if (widget.item.selectedTime.value < 3600000) {
          widget.item.selectedTime.value += 60000;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                widget.item.sectionName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: AppColor.white70,
                  fontSize: size.width > 360 ? 18 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Card(
                elevation: 0,
                color: AppColor.white40,
                child: SizedBox(
                  height: 40,
                  width: 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTapDown: onTapDownDecrement,
                        onTapUp: (TapUpDetails details) => timer?.cancel(),
                        onTapCancel: () => timer?.cancel(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: size.width > 360 ? 18 : 14,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable: widget.item.selectedTime,
                          builder: (context, value, child) {
                            return Expanded(
                              child: Text(
                                ((value ~/ 1000) ~/ 60)
                                    .toString()
                                    .padLeft(2, "0"),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColor.white70,
                                  fontSize: size.width > 360 ? 18 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }),
                      GestureDetector(
                        onTapDown: onTapDownIncrement,
                        onTapUp: (TapUpDetails details) => timer?.cancel(),
                        onTapCancel: () => timer?.cancel(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: size.width > 360 ? 18 : 14,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}