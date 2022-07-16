import 'package:flutter/material.dart';

/// Tile
class WhatsNewFeatureTile extends ListTile {
  /// somsehting
  WhatsNewFeatureTile({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    this.titleColor = Colors.white,
    this.titleSize = 16,
    this.subtitleColor,
    this.subtitleSize,
    required this.icon,
    this.accentColor = Colors.amber,
    this.iconSize = 24,
  }) : super(
          key: key,
          leading: Icon(
            icon,
            color: accentColor,
            size: iconSize,
          ),
          title: Text(
            titleText,
            style: TextStyle(
              color: titleColor,
              fontSize: titleSize,
            ),
          ),
          subtitle: Text(
            subtitleText,
            style: TextStyle(
              color: subtitleColor ?? titleColor.withOpacity(0.5),
              fontSize: subtitleSize ?? titleSize - 4,
            ),
          ),
        );

  /// shwo the text
  final String titleText;

  /// title color
  final Color titleColor;

  /// title size
  final double titleSize;

  /// shwo the text
  final String subtitleText;

  /// title color
  final Color? subtitleColor;

  /// title size
  final double? subtitleSize;

  /// icon
  final IconData icon;

  /// color
  final Color accentColor;

  /// size
  final double iconSize;
}
