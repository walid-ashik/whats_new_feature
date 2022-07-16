import 'package:flutter/material.dart';

/// Tile
class WhatsNewFeatureTile extends ListTile {
  /// somsehting
  WhatsNewFeatureTile({
    Key? key,
    required this.icon,
    required this.titleText,
    required this.subtitleText,
    this.titleColor = Colors.white,
    this.titleSize = 16,
    this.subtitleColor,
    this.subtitleSize,
    this.iconColor = Colors.amber,
    this.iconSize = 24,
  }) : super(
          key: key,
          leading: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
          title: Text(
            titleText,
            style: TextStyle(
              color: titleColor,
              fontSize: titleSize,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              subtitleText,
              style: TextStyle(
                color: subtitleColor ?? titleColor.withOpacity(0.5),
                fontSize: subtitleSize ?? titleSize - 4,
                height: 1.2,
              ),
            ),
          ),
          horizontalTitleGap: 0,
          minVerticalPadding: 8,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
  final Color? iconColor;

  /// size
  final double iconSize;
}
