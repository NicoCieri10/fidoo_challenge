import 'package:fidooo_challenge/config/config.dart';
import 'package:fidooo_challenge/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainApp();
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final GoRouter _router;
  @override
  void initState() {
    super.initState();
    _router = appRouter;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fidooo Challenge',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: AppTheme().themeData,
    );
  }
}
