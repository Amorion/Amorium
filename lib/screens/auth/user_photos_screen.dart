import 'dart:io';

import 'package:amorium/common/screens/loader.dart';
import 'package:amorium/common/utils/utils.dart';
import 'package:amorium/controller/auth/user_information_controller.dart';
import 'package:amorium/screens/auth/widgets/photo_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPhotosScreen extends ConsumerStatefulWidget {
  const UserPhotosScreen({Key? key}) : super(key: key);
  static const String routeName = '/user-photos';
  @override
  ConsumerState<UserPhotosScreen> createState() => _UserPhotosScreenState();
}

class _UserPhotosScreenState extends ConsumerState<UserPhotosScreen> {
  List<File?> userImages = List.generate(6, (index) => null);
  bool isLoading = false;
  void setImage(int idx, File image) {
    userImages[idx] = image;
  }

  void save() async {
    if (userImages[0] == null || userImages[1] == null) {
      showSnackBar(context: context, content: "First two images are mandatory");
      return;
    }
    setState(() {
      isLoading = true;
    });
    await ref.read(userInformationControllerProvider).saveImages(
          context: context,
          images: userImages,
        );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your photos"),
        actions: [IconButton(onPressed: save, icon: const Icon(Icons.save))],
      ),
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Column(
                children: userImages.asMap().entries.map((e) {
                  int idx = e.key;

                  if (idx % 2 == 0) {
                    List<File?> row = [userImages[idx], userImages[idx + 1]];
                    return PhotoRow(
                      photoRow: row,
                      index: idx,
                      setImage: setImage,
                    );
                  } else {
                    return Container();
                  }
                }).toList(),
              ),
            ),
    );
  }
}
