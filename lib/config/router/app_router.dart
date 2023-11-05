import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: LoginScreen.route,
  routes: <GoRoute>[
    GoRoute(
      path: LoginScreen.route,
      name: LoginScreen.route,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: HomeScreen.route,
      name: HomeScreen.route,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '${ChatScreen.route}/:contactId',
      name: ChatScreen.route,
      builder: (context, state) => ChatScreen(
        contactId: state.pathParameters['contactId'],
      ),
    ),
  ],
);
