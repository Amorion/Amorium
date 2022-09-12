import 'dart:io';

import 'package:amorium/common/utils/utils.dart';
import 'package:amorium/common/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class PhotoPreview extends StatefulWidget {
  final File? imageTile;
  final void Function(int, File) setImage;
  final int index;
  const PhotoPreview({
    Key? key,
    required this.imageTile,
    required this.setImage,
    required this.index,
  }) : super(key: key);

  @override
  State<PhotoPreview> createState() => _PhotoPreviewState();
}

class _PhotoPreviewState extends State<PhotoPreview> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () async {
        image = await pickImageFromGallery(context);
        if (image != null) {
          widget.setImage(widget.index, image!);
          setState(() {});
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: image == null
              ? Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  image!,
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
