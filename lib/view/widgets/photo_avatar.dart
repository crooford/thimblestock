import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:thimblestock/model/entity/clients.dart';

import '../pages/capture_image.dart';

class PhotoAvatarWidget extends StatefulWidget {
  final ClientEntity client;
  final String action;
  const PhotoAvatarWidget(
      {super.key, required this.client, required this.action});

  @override
  State<PhotoAvatarWidget> createState() => _PhotoAvatarWidgetState();
}

/* class _PhotoAvatarWidgetState extends State<PhotoAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF17B890),
              radius: 55,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: widget.client.clientAvatar != null
                    ? FileImage(File(widget.client.clientAvatar!))
                    : const AssetImage('assets/clientDefault.jpg')
                        as ImageProvider,
              ),
            )
          ],
        ),
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
              setState(() {
                widget.client.clientAvatar = imagePath;
              });
            },
          ),
        )
      ],
    ));
  }
}
 */

class _PhotoAvatarWidgetState extends State<PhotoAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (widget.client.clientAvatar == null) {
      avatar = InkWell(
        child: const CircleAvatar(
          backgroundColor: Color(0xFF17B890),
          radius: 55,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/thimblestock1.appspot.com/o/clientDefault.jpg?alt=media&token=938d2907-f7d7-48f5-ae90-0f0d7eae8044'),
          ),
        ),
        onTap: () async {
          var nav = Navigator.of(context);

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
      );
    } else if (widget.action == "create") {
      avatar = InkWell(
        child: CircleAvatar(
          backgroundColor: const Color(0xFF17B890),
          radius: 55,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: FileImage(File(widget.client.clientAvatar!)),
          ),
        ),
        onTap: () async {
          var nav = Navigator.of(context);

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
      );
    } else {
      avatar = InkWell(
        child: CircleAvatar(
          backgroundColor: const Color(0xFF17B890),
          radius: 55,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: widget.client.clientAvatar!.startsWith("http")
                ? NetworkImage(widget.client.clientAvatar!)
                : FileImage(File(widget.client.clientAvatar!)) as ImageProvider,
          ),
        ),
        onTap: () async {
          var nav = Navigator.of(context);

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
      );
    }

    return avatar;
  }
}
