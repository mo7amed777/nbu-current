import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:northern_border_university/model/tr.dart';
import 'package:northern_border_university/view/screens/main_screens/Media%20Center/media_center/media_center_screen.dart';
import 'package:northern_border_university/view/screens/onboard/login/dashboard_screen.dart';
import 'package:northern_border_university/view/screens/onboard/login/login_screen.dart';
import 'package:northern_border_university/view/screens/onboard/login/transition_route_observer.dart';
import 'package:northern_border_university/view/screens/splash/introduction_animation_screen.dart';
import 'controller/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.locale ?? Get.deviceLocale,
      translations: Translation(),
      fallbackLocale: Locale('en'),
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
        //TODO if lang is arabic, change the font family to the arabic font family  (NeoSans-AR) and change the direction to rtl in the app theme

        fontFamily: AppTheme.fontName, //in arabic the font family is fontNameAR

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.green),
      ),
      home: const IntroductionAnimationScreen(),
      navigatorObservers: [TransitionRouteObserver()],
      routes: {
        '/media_center': (p0) => MediaCenter(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
