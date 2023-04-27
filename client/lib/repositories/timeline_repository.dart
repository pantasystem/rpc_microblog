
import 'package:client/generated/proto/timeline.pbgrpc.dart';

import 'auth_repository.dart';

class TimelineRepository {
  TimelineRepository({required this.client, required this.authRepository});
  final TimelineServiceClient client;
  final AuthRepository authRepository;
  Future<TimelineResponse> getTimeline({
    String? maxId,
    String? minId,
  }) async {
    return await client.getTimeline(TimelineRequest(maxId: maxId, minId: minId));
  }
}