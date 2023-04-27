
import 'package:client/generated/proto/statuses.pb.dart';
import 'package:client/providers/repositories.dart';
import 'package:client/repositories/timeline_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelineNotifier extends ChangeNotifier {
  TimelineNotifier({required this.timelineRepository});
  final TimelineRepository timelineRepository;

  List<Status> statuses = [];
  String? _minId;

  Future<void> fetchNext() async {
    final res = await timelineRepository.getTimeline(minId: _minId);
    _minId = res.nextMinId;
    statuses.addAll(res.statuses);
    notifyListeners();
  }

  Future<void> refreshLoad() async {
    _minId = null;
    statuses = [];
    await fetchNext();
  }
}

final timelineNotifierProvider = ChangeNotifierProvider((ref){
  return TimelineNotifier(
    timelineRepository: ref.read(timelineRepositoryProvider),
  );
});