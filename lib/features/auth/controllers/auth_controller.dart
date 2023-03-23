import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/core/utils.dart';
import 'package:twitter_clone/features/auth/views/login_view.dart';
import 'package:twitter_clone/features/home/view/home_view.dart';
import 'package:appwrite/models.dart' as model;
import '../../../apis/auth_apis.dart';
import '../../../apis/user_api.dart';
import '../../../models/user_model.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  // return AuthController(ref.watch(authAPIProvider));
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authApi;
  final UserAPI _userApi;
  AuthController({
    required AuthAPI authAPI,
    required UserAPI userAPI,
  })  : _authApi = authAPI,
        _userApi = userAPI,
        super(false);
  // AuthController(this._authApi):super(false);

  Future<model.Account?> currentUser() => _authApi.currentUserAccount();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authApi.signUp(
      email: email,
      password: password,
    );
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) async {
      UserModel userModel = UserModel(
        email: email,
        name: getNameFromEmail(email),
        followers: const [],
        following: const [],
        profilePic: '',
        bannerPic: '',
        uid: '',
        bio: '',
        isTwitterBlue: false,
      );
      final res2 = await _userApi.saveUserData(userModel);
      res2.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(context, 'Account created!. Please login in');
        Navigator.push(context, LoginView.route());
      });
    });
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authApi.login(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        Navigator.push(context, HomeView.route());
      },
    );
  }
}
