import 'package:client/ext/status.dart';
import 'package:client/generated/proto/statuses.pb.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.status,
    required this.onReplyButtonPressed,
    required this.onReblogButtonPressed,
    required this.onAddReactionButtonPressed,
  });

  final Status status;
  final VoidCallback onReplyButtonPressed;
  final VoidCallback onReblogButtonPressed;
  final VoidCallback onAddReactionButtonPressed;

  @override
  Widget build(BuildContext context) {
    final content = getContentStatus(status);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isReblog(status))
            ...[
              Text("${status.account.name}さんがリポストしました"),
              const SizedBox(height: 8),
            ],
          if (isReply(status))
            ...[
              Text("${status.account.name}さんが返信しました"),
              const SizedBox(height: 8),
            ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 円形のアイコン
              AvatarIcon(avatarUrl: content.account.avatarUrl),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content.account.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      content.content,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    ActionButtons(
                      onAddReactionButtonPressed: onAddReactionButtonPressed,
                      onReplyButtonPressed: onReplyButtonPressed,
                      onReblogButtonPressed: onReblogButtonPressed,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.onReplyButtonPressed,
    required this.onAddReactionButtonPressed,
    required this.onReblogButtonPressed,
  });

  final VoidCallback onReplyButtonPressed;
  final VoidCallback onReblogButtonPressed;
  final VoidCallback onAddReactionButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          onPressed: onReplyButtonPressed,
          icon: const Icon(Icons.reply),
        ),
        const SizedBox(
          width: 48,
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          onPressed: onReblogButtonPressed,
          icon: const Icon(Icons.repeat),
        ),
        const SizedBox(
          width: 48,
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          onPressed: onAddReactionButtonPressed,
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
