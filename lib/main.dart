import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'app/components/controllers/PageIndexController.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  final page = Get.put(PageIndexController(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.black),
          textTheme:
              GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
        ),
        initialRoute: AppPages.SPLASHSCREEN,
        getPages: AppPages.routes,
      );
    });
  }
}
