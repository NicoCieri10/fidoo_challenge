import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final unfocus = FocusNode();
  final passwordNode = FocusNode();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    passwordNode.dispose();
    unfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              children: [
                const Spacer(flex: 2),
                const LogoWidget(),
                const Spacer(),
                const Text(
                  'Inicio de sesión',
                  style: TextStyle(fontSize: 26),
                ),
                const Spacer(),
                CustomField(
                  hintText: 'Email',
                  controller: emailController,
                  onTapOutside: (_) => focus.requestFocus(unfocus),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (_) => focus.requestFocus(passwordNode),
                  validator: (value) {
                    const error = 'Ingrese un mail válido.';
                    final email = value?.trim();
                    final emailRegExp = RegExp(
                      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
                    );

                    if (email == null || email == '') return error;
                    if (!emailRegExp.hasMatch(email)) return error;
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomField(
                  hintText: 'Password',
                  controller: passController,
                  obscureText: _obscureText,
                  onTapOutside: (_) => focus.requestFocus(unfocus),
                  focusNode: passwordNode,
                  onFieldSubmitted: (_) => login(),
                  suffixIcon: InkWell(
                    onTap: () => setState(() => _obscureText = !_obscureText),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20.0,
                    ),
                  ),
                  validator: (value) {
                    const error = 'Ingrese una contraseña válida.';
                    final pass = value?.trim();

                    if (pass == null || pass == '') return error;
                    if (pass.length < 6) return error;
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // TODO: reset password
                AuthLinkWidget(
                  question: '¿No tienes cuenta?',
                  link: 'Regístrate',
                  onTap: () => context.goNamed(RegisterScreen.route),
                ),
                const Spacer(flex: 2),
                AuthButton(
                  text: 'Iniciar',
                  onPressed: login,
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    FocusScope.of(context).requestFocus(unfocus);

    if (!formKey.currentState!.validate()) return;
    final email = emailController.value.text;
    final pass = passController.value.text;

    if (email.isEmpty || pass.isEmpty) return;

    final Login login = Login();

    login.setEmail(emailController.value.text);
    login.setPassword(passController.value.text);

    final bool logged = await login.loginWithMail();

    if (!context.mounted) return;
    if (logged) context.pushReplacementNamed(HomeScreen.route);
  }
}
