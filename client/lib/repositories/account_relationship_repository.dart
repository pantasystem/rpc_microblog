import 'package:client/generated/proto/account_relationship.pbgrpc.dart';
import 'package:grpc/grpc.dart';

import 'auth_repository.dart';

class AccountRelationshipRepository {
  AccountRelationshipRepository(
      {required this.client, required this.authRepository});

  final AccountRelationshipServiceClient client;
  final AuthRepository authRepository;

  Future<List<AccountRelationship>> getAccountRelationships(
      {required List<String> accountIds}) async {
    final res = await client.getAccountRelationship(
        GetAccountRelationshipRequest(targetAccountIds: accountIds),
        options: CallOptions(metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        }));
    return res.accountRelationships;
  }
}
