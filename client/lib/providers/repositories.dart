
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/account_repository.dart';
import '../repositories/auth_repository.dart';
import '../repositories/status_repository.dart';
import 'grpc.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository();
});

final accountRepositoryProvider = Provider((ref) {
  return AccountRepository(
    client: ref.read(accountClientProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
});

final statusRepositoryProvider = Provider((ref) {
  return StatusRepository(
    client: ref.read(statusClientProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
});