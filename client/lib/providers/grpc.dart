import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../generated/proto/account.pbgrpc.dart';

final channelProvider = Provider((ref) {
  return ClientChannel('10.0.2.2',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ));
});

final accountClientProvider = Provider((ref) {
  return AccountServiceClient(ref.read(channelProvider));
});
