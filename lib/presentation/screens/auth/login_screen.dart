import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:app_template/presentation/cubit/login/login_cubit.dart';
import 'package:app_template/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(), 
      child: _LoginPage());
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

class _FormContent extends StatelessWidget {
  const _FormContent({
    required this.loginCubit,
    required this.email,
    required this.passwoord,
  });

  final LoginCubit loginCubit;
  final Email email;
  final Password passwoord;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomTitle(text: 'Iniciar Sesión'),
        SizedBox(height: 20),
        CustomTextFormField(
          label: 'Correo',
          onChanged: loginCubit.emailChanged,
          errorMessage: email.errorMessage,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10),
        CustomTextFormField(
          label: 'Contraseña',
          obscureText: true,
          showToggleEye: true,
          onChanged: loginCubit.passwordChanged,
          errorMessage: passwoord.errorMessage,
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
        CusstomButtonField(
          text: 'Ingresar', 
          onPressed: (loginCubit.state.isValid) 
          ? () => context.go('/') //loginCubit.onSubmit
          : null,
          ),
        SizedBox(height: 10),
        CustomButton(
          icon: Icons.fingerprint,
          text: 'Usar Biometria', 
          onPressed: (){},
          themeColor: colors.secondary,
          ),
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
