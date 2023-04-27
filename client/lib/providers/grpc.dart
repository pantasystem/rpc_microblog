import 'package:client/generated/proto/follow.pbgrpc.dart';
import 'package:client/generated/proto/timeline.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../generated/proto/account.pbgrpc.dart';
import '../generated/proto/account_relationship.pbgrpc.dart';
import '../generated/proto/statuses.pbgrpc.dart';

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


final statusClientProvider = Provider((ref) {
  return StatusServiceClient(ref.read(channelProvider));
});

final followClientProvider = Provider((ref) {
  return FollowServiceClient(ref.read(channelProvider));
});

final accountRelationshipClientProvider = Provider((ref) {
  return AccountRelationshipServiceClient(ref.read(channelProvider));
});

final timelineClientProvider = Provider((ref) {
  return TimelineServiceClient(ref.read(channelProvider));
});