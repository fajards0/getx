import 'package:flutter/material.dart'; // Untuk widget utama seperti runApp dan MaterialApp
import 'package:get/get.dart'; // Untuk GetX
import 'package:get_storage/get_storage.dart'; // Untuk GetStorage
import 'app/routes/app_pages.dart'; // Untuk rute aplikasi
import 'package:flutter/gestures.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Event",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
    ),
  );
}
