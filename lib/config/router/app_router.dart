import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: ChatScreen.route,
  routes: <GoRoute>[
    GoRoute(
      path: HomeScreen.route,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: ChatScreen.route,
      builder: (context, state) => const ChatScreen(),
    ),
  ],
);
