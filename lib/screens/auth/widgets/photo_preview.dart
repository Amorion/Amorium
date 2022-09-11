import 'dart:io';

import 'package:amorium/common/utils/utils.dart';
import 'package:amorium/common/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class PhotoPreview extends StatefulWidget {
  const PhotoPreview({Key? key}) : super(key: key);

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
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: image == null
              ? Image.network(
                  'https://media.glamour.com/photos/62c451524cef9e141c95d93f/master/w_2560%2Cc_limit/1406845793',
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
