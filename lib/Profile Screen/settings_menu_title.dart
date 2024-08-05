import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  SettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28, color: Color(0xFFD08FA5),),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtitle,style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.grey),),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
