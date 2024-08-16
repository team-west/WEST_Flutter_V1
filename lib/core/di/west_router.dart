import 'package:go_router/go_router.dart';
import 'package:west_flutter_v1/presentation/sign_in/view/sign_in_screen.dart';
import 'package:west_flutter_v1/presentation/sign_up/view/sign_up_gender_screen.dart';
import 'package:west_flutter_v1/presentation/sign_up/view/sign_up_user_info_screen.dart';

final GoRouter westRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: "/signUpUserInfo",
      builder: (context, state) => const SignUpUserInfoScreen(),
    ),
    GoRoute(
      path: "/signUpGender",
      builder: (context, state) => const SignUpGenderScreen(),
    ),
  ],
);
