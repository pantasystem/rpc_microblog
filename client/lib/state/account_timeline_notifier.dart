
import 'dart:developer';

import 'package:client/generated/proto/statuses.pb.dart';
import 'package:client/providers/repositories.dart';
import 'package:client/repositories/timeline_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class AccountTimelineNotifier extends ChangeNotifier {
  AccountTimelineNotifier({required this.timelineRepository, required this.accountId});
  final TimelineRepository timelineRepository;
  final String accountId;

  List<Status> statuses = [];
  bool _loading = false;

  Future<void> fetchNext() async {
    if (_loading) {
      return;
    }
    try {
      _loading = true;
      final res = await timelineRepository.getAccountTimeline(maxId: statuses.lastOrNull?.id, accountId: accountId);
      log("res: $res");
      statuses.addAll(res.statuses);
    } catch (e) {
      log("error: $e");
      rethrow;
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

final accountTimelineNotifierProvider = ChangeNotifierProvider.family.autoDispose((ref, String accountId){
  return AccountTimelineNotifier(
    timelineRepository: ref.read(timelineRepositoryProvider), accountId: accountId,
  );
});