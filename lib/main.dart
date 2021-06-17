import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spaces/spaces.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wgite_label_app/app/views/page/pages/home_page.dart';
import 'package:wgite_label_app/app/views/page/pages/layout/page_layout.dart';
import '/app/controllers/app_controller.dart';
import '/app/controllers/auth_controller.dart';
import '/app/controllers/user_controller.dart';
import '/app/routes/app_routing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
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
              title: 'Demo Application',
              theme: ThemeData(
                  textTheme: GoogleFonts.sairaTextTheme(Get.textTheme),
                  primaryColor: Colors.grey),
              builder: (context, child) => Spacing(
                dataBuilder: (context) {
                  final mediaQuery = MediaQuery.of(context);
                  if (mediaQuery.size.width > 500) {
                    return SpacingData.generate(30);
                  }
                  return SpacingData.generate(10);
                },
                child: child ?? SizedBox(),
              ),
              home: PageLayout(child: HomePage()),
              getPages: AppRouting.allPages,
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
