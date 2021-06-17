import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/controllers/all_users_controller.dart';
import 'widgets/authenticated.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/avatar.dart';

class AllUsersView extends GetWidget<AllUsersController> {
  @override
  Widget build(BuildContext context) {
    return Authenticated(
      role: 'admin',
      child: FittedBox(
        fit: BoxFit.contain,
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            var width =
                (sizingInformation.isDesktop) ? Get.width / 2 : Get.width;
            return Container(
              width: width,
              height: 600,
              child: StreamBuilder<QuerySnapshot>(
                  stream: controller.firestore.users.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else
                      return ListView(
                        children: snapshot.data!.docs.map((doc) {
                          return Container(
                            child: Card(
                                child: ListTile(
                                    onTap: () => _changeUserMode(
                                        doc['email'],
                                        !(doc.data().containsKey('enabled')
                                            ? doc.data()['enabled']
                                            : false)),
                                    title: SizedBox(
                                      width: Get.width / 2,
                                      child: Text(doc['email']),
                                    ),
                                    subtitle: Text(
                                        doc.data().containsKey('displayName') &&
                                                doc['displayName'] != ''
                                            ? doc['displayName']
                                            : '<empty>'),
                                    leading: Container(
                                      width: 50,
                                      height: 50,
                                      child: Avatar(
                                        avatarUrl:
                                            doc.data().containsKey('avararUrl')
                                                ? doc['avararUrl']
                                                : '',
                                      ),
                                    ),
                                    trailing: Icon(
                                      (doc.data().containsKey('enabled')
                                              ? doc.data()['enabled']
                                              : false)
                                          ? Icons.edit
                                          : Icons.edit_off,
                                    ))),
                          );
                        }).toList(),
                      );
                  }),
            );
          },
        ),
      ),
    );
  }

  _changeUserMode(String email, bool enabled) {
    controller.changeUserMode(email, enabled);
  }
}
