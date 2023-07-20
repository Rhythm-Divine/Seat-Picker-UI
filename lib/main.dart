import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'screens/selectScreen.dart';
import 'utils/seatSelectionHelper.dart';
import 'utils/themeData.dart';
import 'utils/themeHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Setting initial theme to light
  String? initTheme = "light";
  runApp(ScreenUtilInit(
    designSize: const Size(411, 821),
    builder: (context, widget) => MyApp(
      theme: initTheme,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String theme;
  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectionButtonProvider()),
        ChangeNotifierProvider<ThemeHelper>(
          create: (context) => ThemeHelper(theme),
        ),
      ],
      child: Consumer<ThemeHelper>(
        builder: (contex, themeHelper, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeHelper.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: const SelectionButtonPage(),
          );
        },
      ),
    );
  }
}
