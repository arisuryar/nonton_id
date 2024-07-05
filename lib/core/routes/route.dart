import 'package:go_router/go_router.dart';

import '../../domain/entities/transaction.dart';
import '../../presentation/pages/change_password_page/change_password_page.dart';
import '../../presentation/pages/forgot_password_page/forgot_password_page.dart';
import '../../presentation/pages/home_page/home_page.dart';
import '../../presentation/pages/login_page/login_page.dart';
import '../../presentation/pages/movie_detail_page/movie_detail_page.dart';
import '../../presentation/pages/my_wallet_page/my_wallet_page.dart';
import '../../presentation/pages/order_summary_page/order_summary_page.dart';
import '../../presentation/pages/register_page/register_page.dart';
import '../../presentation/pages/seats_page/seats_page.dart';
import '../../presentation/pages/splash_page/splash_page.dart';
import '../../presentation/pages/update_profile_page/update_profile_page.dart';

GoRouter get router => _router;

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/forgot-password',
      name: 'forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'update-profile',
          name: 'update-profile',
          builder: (context, state) => const UpdateProfilePage(),
        ),
        GoRoute(
          path: 'my-wallet',
          name: 'my-wallet',
          builder: (context, state) => const MyWalletPage(),
        ),
        GoRoute(
          path: 'change-password',
          name: 'change-password',
          builder: (context, state) => const ChangePasswordPage(),
        ),
        GoRoute(
          path: 'movie-detail',
          name: 'movie-detail',
          builder: (context, state) => MovieDetailPage(
            isUpComing: state.extra as bool,
          ),
          routes: [
            GoRoute(
              path: 'seats',
              name: 'seats',
              builder: (context, state) => SeatsPage(
                transaction: state.extra as Transaction,
              ),
              routes: [
                GoRoute(
                  path: 'order-summary',
                  name: 'order-summary',
                  builder: (context, state) => OrderSummaryPage(
                    transaction: state.extra as Transaction,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
