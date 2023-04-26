
import 'package:client/generated/proto/account_relationship.pb.dart';
import 'package:grpc/grpc.dart';

import '../generated/proto/follow.pbgrpc.dart';
import 'auth_repository.dart';

class FollowRepository {
  FollowRepository({
    required this.client,
    required this.authRepository
  });
  final FollowServiceClient client;
  final AuthRepository authRepository;

  Future<AccountRelationship> create({required String accountId}) async {
    final res = await client.follow(FollowRequest(accountId: accountId), options: CallOptions(metadata: {
      "Authorization": "Bearer ${await authRepository.getToken()}"
    }));
    return res;
  }

  Future<AccountRelationship> delete({required String accountId}) async {
    final res = await client.unFollow(UnFollowRequest(accountId: accountId), options: CallOptions(metadata: {
      "Authorization": "Bearer ${await authRepository.getToken()}"
    }));
    return res;
  }
}