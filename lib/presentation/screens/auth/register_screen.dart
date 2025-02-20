import 'package:animate_do/animate_do.dart';
import 'package:app_template/infraestructure/inputs/inputs.dart';
import 'package:app_template/presentation/cubit/register/register_cubit.dart';
import 'package:app_template/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  static const name = 'register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
              create: (context) => RegisterCubit(), child: _RegisterView())),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  int formsStep = 1;

  void nextStep() {
    setState(() {
      formsStep = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final registerCubit = context.watch<RegisterCubit>();
    final email = registerCubit.state.email;
    final phoneNumber = registerCubit.state.phoneNumber;
    final password = registerCubit.state.password;
    final confirmPassword = registerCubit.state.confirmPassword;
    final username = registerCubit.state.username;

    return Scaffold(
      bottomNavigationBar: (formsStep == 1)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: registerCubit.state.termsAndConditions.value,
                        onChanged: (bool? value) {
                          registerCubit
                              .termsAndConditionsChanged(value ?? false);
                        },
                      ),
                      const Text('Acepto '),
                      GestureDetector(
                        onTap: () {
                          // Acción al tocar el texto
                        },
                        child: Text(
                          'Términos y condiciones',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Text(' de uso'),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                        text: 'Continuar',
                        onPressed: (registerCubit.state.isStepValid &&
                                registerCubit.state.termsAndConditions.value)
                            ? nextStep
                            : null),
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: CusstomButtonField(
                  text: 'Continuar',
                  onPressed: (registerCubit.state.isValid && registerCubit.state.hasMinLength && registerCubit.state.hasUpperCase && registerCubit.state.hasSpecialCharOrNumber)  
                  ? () {} 
                  : null),
            ),
      body: Column(
        children: [
          // Botón de regreso
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 40,
                  height: 40,
                  color: colors.primary,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      if (formsStep == 2) {
                        setState(() {
                          formsStep--; 
                        });
                      } else if (formsStep == 1) {
                        context.go(
                            '/auth/login'); 
                      }
                    },
                  ),
                ),
              ),
            ),
          ),

          CustomLinearProgressIndicator(
              formsStep: formsStep, finalStep: 2, colors: colors.primary),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: (formsStep == 1)
                  ? FadeInLeft(
                      duration: const Duration(milliseconds: 300),
                      child: _FirstForm(
                        registerCubit: registerCubit,
                        email: email,
                        phoneNumber: phoneNumber,
                        password: password,
                        username: username,
                        onNextStep: nextStep,
                      ),
                    )
                  : FadeInRight(
                      duration: const Duration(milliseconds: 300),
                      child: _SecondForm(
                        registerCubit: registerCubit,
                        password: password,
                        confirmPassword: confirmPassword,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FirstForm extends StatefulWidget {
  const _FirstForm({
    required this.registerCubit,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.username,
    required this.onNextStep,
  });

  final RegisterCubit registerCubit;
  final Email email;
  final PhoneNumber phoneNumber;
  final Password password;
  final Username username;
  final VoidCallback onNextStep;

  @override
  State<_FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<_FirstForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        const CustomTitle(
          text: '¡Hola!',
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 10),
        const CustomSubtitle(
          text: 'Estás a punto de iniciar, solo necesitas completar tus datos.',
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Nombre completo',
            keyboardType: TextInputType.name,
            onChanged: widget.registerCubit.usernameChanged,
            errorMessage: widget.username.errorMessage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: widget.registerCubit.emailChanged,
            errorMessage: widget.email.errorMessage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Teléfono',
            keyboardType: TextInputType.phone,
            onChanged: widget.registerCubit.phoneNumberChanged,
            errorMessage: widget.phoneNumber.errorMessage,
          ),
        ),
      ],
    );
  }
}

class _SecondForm extends StatelessWidget {
  const _SecondForm({
    required this.registerCubit,
    required this.password,
    required this.confirmPassword,
  });

  final RegisterCubit registerCubit;
  final Password password;
  final ConfirmPassword confirmPassword;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        const CustomTitle(
          text: 'Elige una contraseña',
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 10),
        const CustomSubtitle(
          text:
              'Crea una contraseña segura, para proteger tu cuenta y disfrutar del Carnaval sin preocupaciones.',
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Contraseña',
            keyboardType: TextInputType.name,
            obscureText: true,
            showToggleEye: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Repite la contraseña',
            keyboardType: TextInputType.name,
            obscureText: true,
            showToggleEye: true,
            onChanged: registerCubit.confirmPasswordChanged,
            errorMessage: confirmPassword.errorMessage,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Tu contraseña debe tener',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                height: 1.2,
                color: colors.primary,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                registerCubit.state.hasUpperCase ? Icons.check : Icons.close,
                color: registerCubit.state.hasUpperCase
                    ? colors.primary
                    : colors.error,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Al menos una letra mayúscula',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.2,
                  color: Color(0xFF0F2435),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                registerCubit.state.hasMinLength ? Icons.check : Icons.close,
                color: registerCubit.state.hasMinLength
                    ? colors.primary
                    : colors.error,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Un mínimo de 8 caracteres',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.2,
                  color: Color(0xFF0F2435),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                registerCubit.state.hasSpecialCharOrNumber
                    ? Icons.check
                    : Icons.close,
                color: registerCubit.state.hasSpecialCharOrNumber
                    ? colors.primary
                    : colors.error,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Debe tener un caracter especial o un número',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.2,
                  color: Color(0xFF0F2435),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
