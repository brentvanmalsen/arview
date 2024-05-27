import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ARKit Bird',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ARKitSceneView(
        onARKitViewCreated: (controller) => arView(controller),
      ),
    );
  }
}

void arView(ARKitController controller) {
  final birdModelPath = "objects/bird.obj";

  final nodeAr = ARKitNode(
    geometry: ARKitReferenceNode(
      url: birdModelPath,
      scale: Vector3.all(0.1),
    ),
    position: Vector3(0, 0, -1),
    eulerAngles: Vector3.zero(),
  );

  controller.add(nodeAr);
}
