import 'package:app_template/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: _RegisterView()),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final PageController pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
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
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ),

        // Barra de progreso
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 8,
              child: LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomSubtitle(text: '1/2', textAlign: TextAlign.right),
          ],
        ),
        // Contenido con desplazamiento
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: _FirstForm(),
          ),
        ),
      ],
    );
  }
}

class _SecondForm extends StatelessWidget {
  const _SecondForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        const Text(
          'ELIGE UNA CONTRASEÑA',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            height: 1.2,
            color: Color(0XFFEC1424),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Crea una contraseña segura, para proteger tu cuenta y disfrutar del Carnaval sin preocupaciones.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Contraseña',
            keyboardType: TextInputType.name,
            obscureText: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Repite la contraseña',
            keyboardType: TextInputType.name,
            obscureText: true,
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Tu contraseña debe tener',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: Color(0xFFFFAA022),
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.check, 
              color: Color(0xFFFFAA022), 
              size: 20),
              SizedBox(width: 10,),
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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.check, 
              color: Color(0xFFFFAA022), 
              size: 20),
              SizedBox(width: 10,),
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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.close, 
              color: Color(0xFFD3B19B), 
              size: 20),
              SizedBox(width: 10,),
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
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFFFAA02),
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: const Text(
                'Continuar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _FirstForm extends StatefulWidget {
  const _FirstForm();

  @override
  State<_FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<_FirstForm> {
  int? selectedDay;
  int? selectedMonth;
  int? selectedYear;
  bool isReferrals = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        const CustomTitle(
          text: '¡Hola Marcos!',
          textAlign: TextAlign.left,),
        const SizedBox(height: 10),
        const CustomSubtitle(
          text: 'Estás a punto de iniciar iniciar, solo necesitas completar tus datos.',
          textAlign: TextAlign.left,
          ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Nombre completo',
            keyboardType: TextInputType.name,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            label: 'Teléfono',
            keyboardType: TextInputType.phone,
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            child: CustomButton(
              text: 'Continuar', 
              onPressed: (){})
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
