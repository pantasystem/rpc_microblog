
import 'dart:async';

import 'package:client/generated/proto/statuses.pb.dart';
import 'package:client/providers/repositories.dart';
import 'package:client/repositories/timeline_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class TimelineNotifier extends ChangeNotifier {
  TimelineNotifier({required this.timelineRepository}) {
    _listen = timelineRepository.observeNewPosts().listen((event) {
      if (_loading) {
        return;
      }
      if (statuses.any((element) => element.id == event.id)) {
        return;
      }
      statuses = [
        event,
        ...statuses,
      ];
      notifyListeners();
    });
  }
  final TimelineRepository timelineRepository;

  List<Status> statuses = [];
  bool _loading = false;
  StreamSubscription? _listen;


  @override
  void dispose() {
    _listen?.cancel();
    super.dispose();
  }

  Future<void> fetchNext() async {
    if (_loading) {
      return;
    }
    try {
      _loading = true;
      final res = await timelineRepository.getTimeline(maxId: statuses.lastOrNull?.id);
      statuses = [...statuses, ...res.statuses];
    } finally {
      _loading = false;
    }


    notifyListeners();
  }

  Future<void> refreshLoad() async {
    if (_loading) {
      return;
    }
    statuses = [];
    notifyListeners();
    await fetchNext();
  }
}

final timelineNotifierProvider = ChangeNotifierProvider((ref){
  return TimelineNotifier(
    timelineRepository: ref.read(timelineRepositoryProvider),
  );
});