import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta/features/auth/components/light_text.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ListItem(
            icon: CupertinoIcons.location_solid,
            text: 'Add location',
          ),
          ListItem(
            icon: Icons.person_4_outlined,
            text: 'Tag people',
          ),
          ListItem(
            icon: Icons.language,
            text: 'Audience',
          ),
          ListItem(
            icon: Icons.label,
            text: 'Get orders',
          ),
          ListItem(
            icon: Icons.calendar_month,
            text: 'Add reminder',
          ),
          ListItem(
            icon: Icons.music_note,
            text: 'Add music',
          ),
          ListItem(
            icon: Icons.grain_sharp,
            text: 'Boost post',
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String text;
  final IconData icon;
  const ListItem({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        color: Colors.grey.shade200,
        size: 30,
      ),
      title: LightText(
        text: text,
        fontWeight: FontWeight.bold,
        size: 17,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey.shade100,
      ),
    );
  }
}
