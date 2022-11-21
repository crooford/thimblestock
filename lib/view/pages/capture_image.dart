import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:thimblestock/view/widgets/customAppBar.dart';

class CaptureImageWidget extends StatefulWidget {
  final CameraDescription camera;
  const CaptureImageWidget({super.key, required this.camera});

  @override
  State<CaptureImageWidget> createState() => _CaptureImageWidgetState();
}

class _CaptureImageWidgetState extends State<CaptureImageWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: "Capture la imagen"),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(_controller),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          try {
            final nav = Navigator.of(context);
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

            if (!mounted) return;

            nav.pop<String>(image.path);
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$e")));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
