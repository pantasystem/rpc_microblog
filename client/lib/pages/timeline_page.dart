import 'package:client/ext/status.dart';
import 'package:client/pages/components/status_card.dart';
import 'package:client/providers/repositories.dart';
import 'package:client/state/timeline_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(timelineNotifierProvider);
    ref.watch(_initialFetchProvider);
    return RefreshIndicator(
      child: ListView.builder(
          itemCount: notifier.statuses.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == notifier.statuses.length - 1) {
              notifier.fetchNext();
            }
            return StatusCard(
              status: notifier.statuses[index],
              onAddReactionButtonPressed: () {},
              onReplyButtonPressed: () {
                GoRouter.of(context)
                    .push("/status-editor?replyId=${getContentStatus(notifier.statuses[index]).id}");
              },
              onReblogButtonPressed: () {
                ref
                    .read(statusRepositoryProvider)
                    .create(
                      text: "",
                      reblogId: getContentStatus(notifier.statuses[index]).id,
                    )
                    .then(
                  (value) {
                    notifier.refreshLoad();
                  },
                );
              },
            );
          }),
      onRefresh: () {
        return notifier.refreshLoad();
      },
    );
  }
}

final _initialFetchProvider =
    FutureProvider((ref) => ref.read(timelineNotifierProvider).refreshLoad());
