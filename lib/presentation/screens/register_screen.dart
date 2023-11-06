import 'package:fidooo_challenge/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String route = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final unfocus = FocusNode();
  final passwordNode = FocusNode();
  final confirmPasswordNode = FocusNode();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  void dispose() {
    confirmPassController.dispose();
    confirmPasswordNode.dispose();
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
                  'Regístrate',
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
                  hintText: 'Contraseña',
                  controller: passController,
                  obscureText: _obscureText,
                  onTapOutside: (_) => focus.requestFocus(unfocus),
                  onFieldSubmitted: (_) =>
                      focus.requestFocus(confirmPasswordNode),
                  focusNode: passwordNode,
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
                CustomField(
                  hintText: 'Confirmar contraseña',
                  controller: confirmPassController,
                  obscureText: _obscureText2,
                  onTapOutside: (_) => focus.requestFocus(unfocus),
                  focusNode: confirmPasswordNode,
                  onFieldSubmitted: (_) => register(),
                  suffixIcon: InkWell(
                    onTap: () => setState(() => _obscureText2 = !_obscureText2),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _obscureText2
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
                AuthLinkWidget(
                  question: '¿Ya tienes cuenta?',
                  link: 'inicia sesión',
                  onTap: () => context.goNamed(LoginScreen.route),
                ),
                const Spacer(flex: 2),
                AuthButton(
                  text: 'Registrarse',
                  onPressed: register,
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    FocusScope.of(context).requestFocus(unfocus);

    if (!formKey.currentState!.validate()) return;
    final email = emailController.value.text;
    final pass = passController.value.text;
    final confirmPass = confirmPassController.value.text;

    if (email.isEmpty || pass.isEmpty || confirmPass.isEmpty) return;

    if (pass != confirmPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Las contraseñas no coinciden.'),
        ),
      );
      return;
    }

    final Register register = Register();

    register.setEmail(emailController.value.text);
    register.setPassword(passController.value.text);

    final bool logged = await register.registerWithMail();

    if (!context.mounted) return;
    if (logged) context.pushReplacementNamed(HomeScreen.route);
  }
}
