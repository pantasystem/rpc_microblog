
import 'package:client/generated/proto/statuses.pb.dart';
import 'package:client/providers/repositories.dart';
import 'package:client/repositories/timeline_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class TimelineNotifier extends ChangeNotifier {
  TimelineNotifier({required this.timelineRepository});
  final TimelineRepository timelineRepository;

  List<Status> statuses = [];
  bool _loading = false;

  Future<void> fetchNext() async {
    if (_loading) {
      return;
    }
    try {
      _loading = true;
      final res = await timelineRepository.getTimeline(maxId: statuses.lastOrNull?.id);
      statuses.addAll(res.statuses);
    } finally {
      _loading = false;
    }


    notifyListeners();
  }

  Future<void> refreshLoad() async {
    statuses = [];
    await fetchNext();
  }
}

final timelineNotifierProvider = ChangeNotifierProvider((ref){
  return TimelineNotifier(
    timelineRepository: ref.read(timelineRepositoryProvider),
  );
});