import 'package:amorium/screens/auth/widgets/photo_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhotoRow extends StatelessWidget {
  const PhotoRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PhotoPreview(),
        PhotoPreview(),
      ],
    );
  }
}
