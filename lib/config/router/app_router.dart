import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: LoginScreen.route,
  errorBuilder: (context, state) => const RoutingErrorPage(),
  routes: <GoRoute>[
    GoRoute(
      path: LoginScreen.route,
      name: LoginScreen.route,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RegisterScreen.route,
      name: RegisterScreen.route,
      builder: (context, state) => const RegisterScreen(),
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

class RoutingErrorPage extends StatelessWidget {
  const RoutingErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No hay rutas',
        ),
      ),
    );
  }
}
