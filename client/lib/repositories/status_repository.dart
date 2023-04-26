import 'package:client/generated/proto/statuses.pbgrpc.dart';
import 'package:grpc/grpc.dart';

import 'auth_repository.dart';

class StatusRepository {
  StatusRepository({required this.client, required this.authRepository});

  final StatusServiceClient client;
  final AuthRepository authRepository;

  Future<Status> create(
      {required String text, String? replyId, String? reblogId}) async {
    final res = await client.createStatus(
        CreateStatusRequest(
            content: text, replyId: replyId, reblogId: reblogId),
        options: CallOptions(metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        }));
    return res;
  }

  Future<Status> find({required String statusId}) async {
    final res = await client.getStatus(GetStatusRequest(statusId: statusId),
        options: CallOptions(metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        }));

    return res;
  }

  Future<Status> delete({required String statusId}) async {
    final res = await client.deleteStatus(DeleteStatusRequest(statusId: statusId),
        options: CallOptions(metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        }));
    return res;
  }
}
