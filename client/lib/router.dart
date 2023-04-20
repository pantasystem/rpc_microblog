
import 'package:client/pages/home_page.dart';
import 'package:client/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  final router = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        path: "/home",
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        path: "/register",
        pageBuilder: (context, state) {
          return const MaterialPage(child: RegisterPage());
        },
      ),
    ]
  );
  return router;
});