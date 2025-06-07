import 'package:app_template/presentation/modules/auth/providers/login_form_provider.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:app_template/presentation/cubit/login/login_cubit.dart';
import 'package:app_template/presentation/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(), child: _LoginPage());
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage();
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final email = loginCubit.state.email;
    final passwoord = loginCubit.state.password;
    return Scaffold(
      bottomNavigationBar: _RegisterButton(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _FormContent(
            loginCubit: loginCubit,
            email: email,
            passwoord: passwoord,
          ),
        ),
      ),
    );
  }
}

class _FormContent extends ConsumerStatefulWidget {
  const _FormContent({
    required this.loginCubit,
    required this.email,
    required this.passwoord,
  });

  final LoginCubit loginCubit;
  final Email email;
  final Password passwoord;

  @override
  FormContentState createState() => FormContentState();
}

class FormContentState extends ConsumerState<_FormContent> {
  bool isBiometric = false;
  @override
  void initState() {
    _loadBiometric();
    super.initState();
  }

  Future<void> _loadBiometric() async {
    final prefs = await SharedPreferences.getInstance();
    final biometric = prefs.getBool('biometric');
    if (biometric != null) {
      setState(() {
        isBiometric = biometric;
      });
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loginForm = ref.watch(loginFormProvider);
    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isNotEmpty) {
        showSnackbar(context, next.errorMessage);
      }
    });
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomTitle(text: 'Iniciar Sesión'),
        SizedBox(height: 20),
        CustomTextFormField(
          label: 'Correo',
          onChanged: ref.read(loginFormProvider.notifier).onEmailChanged,
          errorMessage:
              loginForm.email.isPure ? null : loginForm.email.errorMessage,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
          showToggleEye: true,
          onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
          errorMessage: loginForm.password.isPure
              ? null
              : loginForm.password.errorMessage,
          keyboardType: TextInputType.text,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              context.go('/auth/reset-password');
            },
            child: const Text(
              'Olvidé mi contraseña',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        CustomButtonField(
          text: 'Ingresar',
          onPressed: loginForm.isValid
              ? () => ref.read(loginFormProvider.notifier).onFormSubmit()
              : null,
        ),
        SizedBox(height: 10),
        (isBiometric)
            ? CustomButton(
                icon: Icons.fingerprint,
                text: 'Usar Biometria',
                onPressed: () async {
                  await ref.read(authProvider.notifier).loginWithBiometric();
                },
                themeColor: colors.secondary,
              )
            : SizedBox(
                height: 0,
              )
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '¿No tienes cuenta?',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              context.go('/auth/register');
            },
            child: const Text(
              'Registrate',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
