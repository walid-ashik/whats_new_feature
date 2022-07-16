import 'package:flutter/material.dart';
import 'package:whats_new_feature/whats_new_feature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _showWhatsNew();
  }

  Future<void> _showWhatsNew() async {
    await const WhatsNewFeature().showWhatsNew(
      context,
      showWhatsNew: true,
      navigatedToWhatsNewPage: () {},
      features: [
        WhatsNewFeatureTile(
          icon: Icons.browse_gallery_rounded,
          titleText: 'Story Size Quote',
          subtitleText:
              'Now you can create portrait or story size quote in the app and you can easily share it',
        ),
        WhatsNewFeatureTile(
          icon: Icons.pages,
          titleText: 'Image Cropper',
          subtitleText:
              'Now you can create portrait or story size quote in the app and you can easily share it',
        ),
        WhatsNewFeatureTile(
          icon: Icons.image,
          titleText: 'Persist last style',
          subtitleText:
              'Now quote writer app will persist the last edited style with image',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text('Whats New Feature'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
