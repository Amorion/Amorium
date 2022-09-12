import 'dart:io';

import 'package:amorium/screens/auth/widgets/photo_preview.dart';
import 'package:flutter/material.dart';

class PhotoRow extends StatelessWidget {
  final List<File?> photoRow;
  final void Function(int, File) setImage;
  final int index;
  const PhotoRow({
    Key? key,
    required this.photoRow,
    required this.setImage,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PhotoPreview(
          imageTile: photoRow[0],
          setImage: setImage,
          index: index,
        ),
        PhotoPreview(
          imageTile: photoRow[1],
          setImage: setImage,
          index: index + 1,
        ),
      ],
    );
  }
}
