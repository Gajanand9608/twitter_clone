import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/error_page.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/features/home/view/home_view.dart';
import 'package:twitter_clone/theme/app_theme.dart';
import 'features/auth/views/signup_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter clone',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {
            if (user != null) {
              return const HomeView();
            }
            return const SignUpView();
          },
          error: (er, st) => ErrorPage(
                error: er.toString(),
              ),
          loading: () {
            return const LoadingPage();
          }),
    );
  }
}
