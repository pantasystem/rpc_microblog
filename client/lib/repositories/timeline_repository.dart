
import 'dart:developer';

import 'package:client/generated/proto/timeline.pbgrpc.dart';
import 'package:grpc/grpc.dart';

import 'auth_repository.dart';

class TimelineRepository {
  TimelineRepository({required this.client, required this.authRepository});
  final TimelineServiceClient client;
  final AuthRepository authRepository;
  Future<TimelineResponse> getTimeline({
    String? maxId,
    String? minId,
  }) async {
    return await client.getTimeline(
      TimelineRequest(maxId: maxId, minId: minId),
        options: CallOptions(metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        })
    );
  }

  Future<TimelineResponse> getAccountTimeline({required String accountId, String? maxId, String? minId,}) async {
    log("call getAccountTimeline");
    return await client.getAccountTimeline(
        AccountTimelineRequest(accountId: accountId, maxId: maxId, minId: minId),
      options: CallOptions(metadata: {
        "Authorization": "Bearer ${await authRepository.getToken()}"
      })
    );
  }
}