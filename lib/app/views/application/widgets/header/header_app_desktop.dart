import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaces/spaces.dart';
import '/app/services/get_in_touch.dart';
import '/app/views/page/styles/styles.dart';

class HeaderAppDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spacing = Spacing.of(context);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: TextButton(
              onPressed: () => Get.toNamed('/'),
              child: Container(
                alignment: Alignment.centerLeft,
                margin: spacing.insets.onlyLeft.small,
                constraints: BoxConstraints.loose(Size.fromHeight(100)),
                decoration: logo,
                height: 120,
              ),
            ),
          ),
          SizedBox(width: 25),
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
            child: SizedBox(
                height: 60,
                width: 150,
                child: ElevatedButton(
                  onPressed: () => getInTouch(),
                  child: Text('Get In Touch'),
                )),
          )
        ],
      ),
    );
  }
}
