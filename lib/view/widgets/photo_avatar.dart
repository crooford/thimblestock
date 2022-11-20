/* import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:thimblestock/model/entity/clients.dart';

import '../pages/capture_image.dart';

class PhotoAvatarWidget extends StatefulWidget {
  final ClientEntity client;
  const PhotoAvatarWidget({super.key, required this.client});

  @override
  State<PhotoAvatarWidget> createState() => _PhotoAvatarWidgetState();
}

class _PhotoAvatarWidgetState extends State<PhotoAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (widget.client.clientAvatar == null) {
      SizedBox(
          width: 120,
          height: 120,
          child: IconButton(
            icon: const Icon(Icons.camera_alt),
            alignment: Alignment.bottomRight,
            color: const Color(0xFF3185FC),
            onPressed: () async {
              final nav = Navigator.of(context);

              final cameras = await availableCameras();
              final camera = cameras.first;
              var imagePath = await nav.push<String>(
                MaterialPageRoute(
                  builder: (context) => CaptureImageWidget(camera: camera),
                ),
              );

              if (imagePath != null && imagePath.isNotEmpty) {
                setState(() {
                  widget.client.clientAvatar = imagePath;
                });
              }
            },
          ));
    } else {
      avatar = CircleAvatar(
        backgroundImage: FileImage(File(widget.client.clientAvatar!)),
      );
    }
    return avatar;
  }
}
 */