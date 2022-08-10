import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whats_new_feature/src/widgets/whats_new_feature_page.dart';
import 'package:whats_new_feature/src/widgets/whats_new_feature_tile.dart';

/// {@template whats_new_feature}
/// Show apple like whats new feature in the latest update
/// {@endtemplate}
class WhatsNewFeature {
  /// {@macro whats_new_feature}
  const WhatsNewFeature();

  /// to obtain previous installed version
  static const String installedAppVersionKey = 'installed_app_version_key';

  /// show whats new page
  Future<void> showWhatsNew(
    BuildContext context, {
    required bool showWhatsNew,
    Function()? navigatedToWhatsNewPage,
    required List<WhatsNewFeatureTile> features,
    Color buttonColor = Colors.amber,
    Duration delay = const Duration(seconds: 1),
  }) async {
    // do not navigate to whats new page if [showWhatsNew] false
    if (showWhatsNew == false) return;

    final packageInfo = await PackageInfo.fromPlatform();

    final prefs = await SharedPreferences.getInstance();

    final currentAppVersion = packageInfo.buildNumber;

    final previousAppVersion = prefs.getString(installedAppVersionKey) ?? '';

    /// do not show whats new feature page on the first install
    ///
    /// on the first install, [previousAppVersion] will always be empty
    if (previousAppVersion.isEmpty) {
      await prefs.setString(installedAppVersionKey, currentAppVersion);
      return;
    }

    if (currentAppVersion != previousAppVersion) {
      await prefs.setString(installedAppVersionKey, currentAppVersion);
      navigatedToWhatsNewPage?.call();
      Future.delayed(delay, () {
        _navigateToWhatsNewPage(
          context,
          features,
          packageInfo.appName,
          buttonColor,
        );
      });
    }
  }

  void _navigateToWhatsNewPage(
    BuildContext context,
    List<WhatsNewFeatureTile> features,
    String appName,
    Color? buttonColor,
  ) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => WhatsNewFeaturePage(
          buttonColor: buttonColor,
          features: features,
          appName: appName,
        ),
      ),
    );
  }
}
