import 'package:flutter/material.dart';

import '../../feature/timer/widget/data_provider.dart';
import '../../feature/timer/widget/inherited_widget.dart';
import '../../feature/timer/widget/timer_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = DataProvider();
    return Provider(
      dataProvider: dataProvider,
      child: MaterialApp(
        title: "Timer App G7",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Poppins",
        ),
        home: const TimerScreen(),
      ),
    );
  }
}
