import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import 'inherited_widget.dart';
import 'minute_adder.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final dataProvider = Provider.of(context,false);

    return Align(
      alignment: const Alignment(0, -.9),
      child: SizedBox(
        height: size.width > 360 ? 400 : 330,
        width: size.width > 360 ? 300 : 230,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: AppColor.mainColor,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: size.width > 360 ? 24 : 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                      ),
                    ),
                    CloseButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 0.0),
                        ),
                        visualDensity: VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                      color: AppColor.white,
                      onPressed: dataProvider.onSettingsClosed,
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    Text(
                      "TIME (MINUTES)",
                      style: TextStyle(
                        color: AppColor.white70,
                        fontSize: size.width > 360 ? 18 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            dataProvider.data.map<Widget>((e) => MinuteAdder(e)).toList(),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      "FONT",
                      style: TextStyle(
                        color: AppColor.white70,
                        fontSize: size.width > 360 ? 18 : 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: CircleAvatar(
                            backgroundColor: AppColor.white,
                            radius: size.width > 360 ? 15 : 10,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


