import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<CameraDescription> cameras = [];
  CameraController? cameraController;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: SizedBox.expand(
        child: Stack(
          children: [
            // Camera Preview
            Positioned.fill(
              child: CameraPreview(cameraController!),
            ),
            // Flash Button (top left)
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(
                  isFlashOn ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    isFlashOn = !isFlashOn;
                  });
                  cameraController?.setFlashMode(
                      isFlashOn ? FlashMode.torch : FlashMode.off);
                },
              ),
            ),
            // Switch Camera Button (top right)
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: Icon(
                  Icons.switch_camera,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: _switchCamera,
              ),
            ),
            // Capture Button (center bottom)
            Positioned(
              bottom: 60,
              left: MediaQuery.of(context).size.width * 0.4,
              child: GestureDetector(
                onTap: () async {
                  XFile picture = await cameraController!.takePicture();
                  Gal.putImage(picture.path);
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.photo_camera,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            // Gallery Access Button (bottom left)
            Positioned(
              bottom: 20,
              left: 20,
              child: IconButton(
                icon: Icon(
                  Icons.photo_library,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  // Navigate to gallery or handle gallery functionality
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _setupCameraController() async {
    List<CameraDescription> cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      setState(() {
        cameras = cameras;
        cameraController =
            CameraController(cameras.first, ResolutionPreset.high);
      });
      cameraController?.initialize().then((_) {
        setState(() {});
      });
    }
  }

  // Switch camera between front and back
  Future<void> _switchCamera() async {
    if (cameras.isNotEmpty) {
      CameraDescription newCamera = cameras.firstWhere(
        (camera) => camera != cameraController!.description,
        orElse: () => cameras.first,
      );
      cameraController = CameraController(newCamera, ResolutionPreset.high);
      await cameraController?.initialize();
      setState(() {});
    }
  }
}
