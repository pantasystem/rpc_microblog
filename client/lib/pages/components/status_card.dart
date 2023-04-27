import 'package:client/generated/proto/statuses.pb.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.status});

  final Status status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 円形のアイコン
          AvatarIcon(avatarUrl: status.account.avatarUrl),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.account.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  status.content,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                ActionButtons(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(Icons.reply),
        ),
        const SizedBox(
          width: 48,
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(Icons.repeat),
        ),
        const SizedBox(
          width: 48,
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(Icons.add_reaction),
        ),
      ],
    );
  }
}


class AvatarIcon extends StatelessWidget {
  final String avatarUrl;

  const AvatarIcon({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundImage: NetworkImage(avatarUrl),
    );
  }
}