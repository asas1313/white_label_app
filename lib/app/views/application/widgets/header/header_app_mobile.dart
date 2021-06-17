import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wgite_label_app/app/views/page/styles/styles.dart';

class HeaderAppMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints.loose(Size.fromHeight(70)),
              height: 120,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => Get.toNamed('/'),
                    child: Text(
                      companyName.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    companySlogan,
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: TextButton(
              onPressed: () => Get.toNamed('/'),
              child: Container(
                alignment: Alignment.centerLeft,
                constraints: BoxConstraints.loose(Size.fromHeight(120)),
                decoration: logo,
                height: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
