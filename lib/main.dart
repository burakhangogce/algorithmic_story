import 'package:algorithmic_story/modules/boarding/controllers/boarding_controller.dart';
import 'package:algorithmic_story/modules/boarding/screens/boarding_page.dart';
import 'package:algorithmic_story/commons/utils/theme.dart';
import 'package:algorithmic_story/commons/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => BoardingController(),
        child: const BoardingPage(),
      ),
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
    );
  }
}
