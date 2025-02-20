import 'package:app_template/presentation/cubit/resetPassword/reset_password_cubit.dart';
import 'package:app_template/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 40,
                height: 40,
                color: colors.primary,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    context.go('/auth/login');
                  },
                ),
              ),
            ),
          ),
        ),
        body: _BodyResetPassword(),
        bottomNavigationBar: _BottomButton() ,
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton();

  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = context.watch<ResetPasswordCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CusstomButtonField(
          text: 'Enviar', 
          onPressed: (resetPasswordCubit.state.isValid) 
          ? resetPasswordCubit.onSubmit
          : null
          ),
      ),
    );
  }
}

class _BodyResetPassword extends StatelessWidget {
  const _BodyResetPassword();

  @override
  Widget build(BuildContext context) {
    final resetPasswordCubit = context.watch<ResetPasswordCubit>();
    final email = resetPasswordCubit.state.email;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          const CustomTitle(
          text: 'Olvidaste tu contraseña', 
          textAlign: TextAlign.left),
          const CustomSubtitle(
            text: 'Ingresa tu correo para restablecer tu contraseña',
            textAlign: TextAlign.left,
            ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              keyboardType: TextInputType.emailAddress, 
              label: 'Correo Electronico',
              onChanged: resetPasswordCubit.emailChanged,
              errorMessage: email.errorMessage,
            ),
          ),
        ]
        )
    );
  }
}
