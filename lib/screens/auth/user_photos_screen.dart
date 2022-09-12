import 'dart:io';

import 'package:amorium/screens/auth/widgets/photo_preview.dart';
import 'package:amorium/screens/auth/widgets/photo_row.dart';
import 'package:amorium/static/theme_data.dart';
import 'package:flutter/material.dart';

class UserPhotosScreen extends StatefulWidget {
  const UserPhotosScreen({Key? key}) : super(key: key);
  static const String routeName = '/user-photos';
  @override
  State<UserPhotosScreen> createState() => _UserPhotosScreenState();
}

class _UserPhotosScreenState extends State<UserPhotosScreen> {
  List<File?> userImages = List.generate(6, (index) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your photos"),
        backgroundColor: CustomTheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: userImages.asMap().entries.map((e) {
            int idx = e.key;
            File? value = e.value;

            if (idx % 2 == 0) {
              return Container();
            }
            if (idx < 2) {
              return PhotoRow();
            }

            if (idx < 4) {
              return PhotoRow();
            }
            return PhotoRow();
          }).toList(),
        ),
      ),
    );
  }
}
