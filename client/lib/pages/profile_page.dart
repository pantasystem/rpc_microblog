import 'dart:developer';

import 'package:client/generated/proto/account.pb.dart';
import 'package:client/generated/proto/account_relationship.pbgrpc.dart';
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
    final profile =
        ref.watch(accountInfoFutureFamilyProvider(widget.accountId));
    final relation =
        ref.watch(accountRelationFutureFamilyProvider(widget.accountId));
    return Scaffold(
      appBar: AppBar(
        title: Text(profile.when(
          data: (profile) => profile.name,
          loading: () => "Loading...",
          error: (error, stackTrace) => "Error",
        )),
      ),
      body: ListView(
        children: [
          profile.when(
            data: (profile) => ProfilePageHeader(
                onToggleFollow: () async {
                  if (relation.valueOrNull?.isFollowing == true) {
                    ref.read(followRepositoryProvider).delete(accountId: widget.accountId);
                  } else {
                    ref.read(followRepositoryProvider).create(accountId: widget.accountId);
                  }
                  ref.refresh(accountRelationFutureFamilyProvider(widget.accountId));
                },
                account: profile,
                relationship: relation.valueOrNull),
            loading: () => const Text("Loading..."),
            error: (error, stackTrace) => const Text("Error"),
          ),
        ],
      )
    );
  }
}

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader(
      {super.key,
      required this.account,
      this.relationship,
      required this.onToggleFollow});

  final Account account;
  final AccountRelationship? relationship;
  final VoidCallback onToggleFollow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarIcon(avatarUrl: account.avatarUrl, radius: 40),
            const SizedBox(
              height: 16,
            ),
            Text(account.name),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              onPressed: onToggleFollow,
              child: () {
                if (relationship?.isFollowing == true) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.person_remove),
                      SizedBox(width: 16,),
                      Text("フォロー解除")
                    ],
                  );
                } else {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.person_add),
                      SizedBox(width: 16,),
                      Text("フォロー")
                    ],
                  );
                }
              }(),
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text("投稿数: ${account.postCount}",),
                  Text("フォロー中: ${account.followingCount}"),
                  Text("フォロワー: ${account.followerCount}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

final accountInfoFutureFamilyProvider =
    FutureProvider.family((ref, String accountId) {
  return ref.read(accountRepositoryProvider).find(accountId: accountId);
});

final accountRelationFutureFamilyProvider =
    FutureProvider.family((ref, String accountId) async {
  final items = await ref
      .read(accountRelationshipRepositoryProvider)
      .getAccountRelationships(accountIds: [accountId]);
  return items.firstOrNull;
});
