import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/controllers/app_controller.dart';
import '/app/controllers/auth_controller.dart';
import '/app/controllers/user_controller.dart';
import '/app/routes/app_routing.dart';
import 'app/views/page/home_view.dart';
import '/app/views/application/layout/layout_template.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authController = Get.put(AuthController());
  final appController = Get.put(AppController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text('Something went wrong!'),
              ),
            );
          } else if (snapshot.hasData) {
            return GetMaterialApp(
              title: 'InkuboX app',
              theme: ThemeData(
                  textTheme: GoogleFonts.sairaTextTheme(Get.textTheme),
                  primaryColor: Colors.grey),
              home: LayoutTemplate(child: HomeView()),
              getPages: AppRouting.appPages,
            );
          } else {
            // Otherwise, show something whilst waiting for initialization to complete
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Text('Loading...'),
              ),
            );
          }
        });
  }
}
