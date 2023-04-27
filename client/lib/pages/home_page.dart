import 'package:client/pages/account_page.dart';
import 'package:client/pages/search_user_page.dart';
import 'package:client/pages/timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState {
  HomeTab _currentTab = HomeTab.timeline;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(currentTab: _currentTab),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push("/status-editor");
        },
        child: const Icon(Icons.add),
      ),
      body: IndexedStack(
        index: _currentTab.index,
        children: const [
          TimelinePage(),
          SearchUserPage(),
          AccountPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        iconSize: 26,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _currentTab = HomeTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: "タイムライン",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          )
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.currentTab});

  final HomeTab currentTab;


  @override
  Widget build(BuildContext context) {
    switch(currentTab) {

      case HomeTab.timeline:
        return const Text("タイムライン");
      case HomeTab.search:
        return const Text("検索");
      case HomeTab.profile:
        return const Text("プロフィール");
    }
  }
}

enum HomeTab {
  timeline,
  search,
  profile,
}