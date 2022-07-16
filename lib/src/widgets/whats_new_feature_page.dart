import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:whats_new_feature/src/widgets/whats_new_feature_tile.dart';
import 'package:whats_new_feature/src/widgets/continue_button.dart';

class WhatsNewFeaturePage extends StatefulWidget {
  /// Whats new feature page
  const WhatsNewFeaturePage({
    Key? key,
    required this.features,
    this.appName,
  }) : super(key: key);

  /// list of whats new features
  final List<WhatsNewFeatureTile> features;

  /// your app name
  final String? appName;

  @override
  State<WhatsNewFeaturePage> createState() => _WhatsNewFeaturePageState();
}

class _WhatsNewFeaturePageState extends State<WhatsNewFeaturePage> {
  late String _appName;

  @override
  void initState() {
    super.initState();

    _initAppName();
  }

  Future<void> _initAppName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _appName = widget.appName ?? packageInfo.appName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildWhatsNewFeatures(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ContinueButton(
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatsNewFeatures() {
    return ListView(
      children: [
        const SizedBox(
          height: 60,
        ),
        Text(
          "What's new\n$_appName",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        ...widget.features,
      ],
    );
  }
}
