import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

class ARViewPage extends StatelessWidget {
  final String imagePath;

  const ARViewPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR View'),
      ),
      body: ARKitSceneView(
        onARKitViewCreated: (controller) => _arView(controller, imagePath),
      ),
    );
  }

  void _arView(ARKitController controller, String imagePath) {
    final imageTexture = ARKitMaterialProperty.image(imagePath);

    final nodeAr = ARKitNode(
      geometry: ARKitSphere(
        materials: [
          ARKitMaterial(
            diffuse: imageTexture,
            doubleSided: true,
          ),
        ],
        radius: 1,
      ),
      position: Vector3(0, 0, -1),
    );

    controller.add(nodeAr);
  }
}
