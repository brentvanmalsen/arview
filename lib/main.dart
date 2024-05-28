import 'package:flutter/material.dart';
import 'ar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter ARview',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _showImageSelectionDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Image.asset('images/image.jpg',
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: const Text('Natuurgebied'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ImagePreviewPage(
                              imagePath: 'images/image.jpg'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset('images/image2.jpg',
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: const Text('Groot plein'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ImagePreviewPage(
                              imagePath: 'images/image2.jpg'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset('images/image3.jpg',
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: const Text('Rivier uitzicht'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ImagePreviewPage(
                              imagePath: 'images/image3.jpg'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showImageSelectionDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            shadowColor: Colors.tealAccent,
            elevation: 10,
          ),
          child: const Text('Open app gallerij'),
        ),
      ),
    );
  }
}

class ImagePreviewPage extends StatelessWidget {
  final String imagePath;

  const ImagePreviewPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, height: 280, width: 285, fit: BoxFit.cover),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ARViewPage(imagePath: imagePath),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.tealAccent,
                elevation: 10,
              ),
              child: const Text('Gebruik afbeelding in AR'),
            ),
          ],
        ),
      ),
    );
  }
}
