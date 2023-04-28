
import 'package:client/providers/repositories.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key, required this.accountId});
  final String accountId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(accountInfoFutureFamilyProvider(widget.accountId));
    final relation = ref.watch(accountRelationFutureFamilyProvider(widget.accountId));
    return Scaffold();
  }
}

final accountInfoFutureFamilyProvider = FutureProvider.family((ref, String accountId) {
  return ref.read(accountRepositoryProvider).find(accountId: accountId);
});

final accountRelationFutureFamilyProvider = FutureProvider.family((ref, String accountId) async {
  final items = await ref.read(accountRelationshipRepositoryProvider).getAccountRelationships(accountIds: [accountId]);
  return items.firstOrNull;
});

