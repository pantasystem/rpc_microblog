import 'package:client/pages/components/status_card.dart';
import 'package:client/state/timeline_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelinePage extends ConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(timelineNotifierProvider);
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: notifier.statuses.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == notifier.statuses.length - 1) {
            notifier.fetchNext();
          }
          return StatusCard(status: notifier.statuses[index]);
        }),
      onRefresh: () {
        return notifier.refreshLoad();
      },
    );
  }
}