import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String role = '';
  String email = '';
  String displayName = '';
  String position = '';
  String phone = '';
  bool enabled = false;
  String avatarUrl = '';

  UserModel({
    required this.role,
    required this.email,
    this.displayName = '',
    this.position = '',
    this.phone = '',
    this.enabled = false,
    this.avatarUrl = '',
  });

  UserModel.fromDocumentSnapshot(
      {@required required DocumentSnapshot documentSnapshot}) {
    email = documentSnapshot.data()!['email'];
    role = documentSnapshot.data()!['role'];
    displayName = documentSnapshot.data()!.containsKey('displayName')
        ? documentSnapshot.data()!['displayName']
        : '';
    position = documentSnapshot.data()!.containsKey('position')
        ? documentSnapshot.data()!['position']
        : '';
    phone = documentSnapshot.data()!.containsKey('phone')
        ? documentSnapshot.data()!['phone']
        : '';
    enabled = documentSnapshot.data()!.containsKey('enabled')
        ? documentSnapshot.data()!['enabled']
        : false;
    avatarUrl = documentSnapshot.data()!.containsKey('avatarUrl')
        ? documentSnapshot.data()!['avatarUrl']
        : '';
  }
}
