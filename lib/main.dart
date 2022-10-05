import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        title: 'Jobblish',
        fallbackLocale: Locale('en_US'),
        theme: mainTheme,
        locale: Locale('en_US'),
        translations: TranslationsService(),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.downToUp,
        initialBinding: InitialBinding(),
        home: SplashView(),
      ),
    );
  }
}

Future<void> initializeNotifications() async {
  await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: CustomColors.kPrimary,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
}
