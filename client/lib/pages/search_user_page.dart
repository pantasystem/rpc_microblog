
import 'package:client/providers/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchUserPage extends ConsumerWidget {
  SearchUserPage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(_searchUsersFutureFamilyProvider(_searchController.text));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: "Search user",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: accounts.when(
              data: (accounts) {
                return ListView.builder(
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    final account = accounts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(account.avatarUrl),
                      ),
                      title: Text(account.name),
                      onTap: () {
                        GoRouter.of(context).push('/profile/${account.id}');
                      },
                    );
                  },
                );
              },
              loading: () {
                return const Center(child: CircularProgressIndicator(),);
              },
              error: (error, stackTrace) {
                return Center(child: Text(error.toString()),);
              },
            ),
          ),
        ],
      ),
    );
  }
}

final _searchUsersFutureFamilyProvider = FutureProvider.family((ref, String query) async {
  return ref.read(accountRepositoryProvider).search(query: query);
});