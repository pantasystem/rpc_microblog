
import 'package:client/pages/components/status_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(profile.when(
          data: (profile) => profile.name,
          loading: () => "Loading...",
          error: (error, stackTrace) => "Error",
        )),
      ),
      body: profile.when(
        data: (profile) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarIcon(avatarUrl: profile.avatarUrl),
            Text(profile.name),
            TextButton(onPressed: () {}, child: relation.valueOrNull?.isFollowing == true ? const Text("Unfollow") : const Text("Follow")),
          ],
        ),
        loading: () => const Text("Loading..."),
        error: (error, stackTrace) => const Text("Error"),
      )
    );
  }
}

final accountInfoFutureFamilyProvider = FutureProvider.family((ref, String accountId) {
  return ref.read(accountRepositoryProvider).find(accountId: accountId);
});

final accountRelationFutureFamilyProvider = FutureProvider.family((ref, String accountId) async {
  final items = await ref.read(accountRelationshipRepositoryProvider).getAccountRelationships(accountIds: [accountId]);
  return items.firstOrNull;
});

