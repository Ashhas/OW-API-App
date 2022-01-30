import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final int? titleMaxLines;
  final String? subtitle;
  final int? subtitleMaxLines;
  final Widget? leading;
  final Widget? trailing;
  final Function(BuildContext context) onPressed;
  final bool? enabled;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Color? switchActiveColor;

  const SettingsTile({
    Key? key,
    required this.title,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.trailing,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.enabled = true,
    required this.onPressed,
    this.switchActiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: titleTextStyle),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: subtitleTextStyle,
              maxLines: subtitleMaxLines,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      leading: leading,
      enabled: enabled!,
      trailing: trailing,
      onTap: onTapFunction(context) as void Function(),
    );
  }

  Function onTapFunction(BuildContext context) => onPressed.call(context);
}
