import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String subCaption;
  final String imgUrl;

  SlideInfo(this.title, this.caption, this.subCaption, this.imgUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'AQUI ARRANCA LA GOZADERA',
      'Ponte pilas y cumple los retos, pa’ que acumules las lukas que podrás cambiar por experiencias carnavaleras bacanísimas ',
      'Más retos, Más Lukas ¡Erda Cipote Vacile!',
      'assets/Images/onboarding1.png'),
  SlideInfo(
      '¡PA’ QUE TE AGENDES!',
      'Conciertos, festivales, desfiles,actividades de las Reinas ¡de todo pa’ que estes pleno, en la jugada!',
      '¡Full Gozadera!',
      'assets/Images/onboarding2.png'),
  SlideInfo(
      '¡PON A REVENTAR ESA BILLETERA!',
      'Cambia tus lukas por entradas a eventos súper chéveres, y experiencias carnavaleras VIP.',
      '¡Pa’ que vivas tremendo Rumbón!',
      'assets/Images/onboarding3.png'),
];

class Onboarding extends StatefulWidget {
  static const name = 'onboarding-screen';
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageViewController = PageController();
  bool enReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!enReached && page >= (slides.length - 1.5)) {
        setState(() {
          enReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBE9DC),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/Images/background_barranquilla.png',
            fit: BoxFit.cover,
          )),
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slidesData) => _Slide(
                      title: slidesData.title,
                      caption: slidesData.caption,
                      subCaption: slidesData.subCaption,
                      imageUrl: slidesData.imgUrl,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () {
                  context.push('/auth/login');
                },
                child: const Text(
                  'Ya tengo una cuenta', 
                  style: TextStyle(color: Color(0xFFFFAA02)),
                  )),
          ),
          enReached
              ? Positioned(
                  bottom: 30,
                  left: 20, // Margen izquierdo
                  right: 20, // Margen derecho
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 200),
                    child: SizedBox(
                      width: double.infinity, // Ocupa todo el ancho disponible
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xFFFFAA02), // Color del botón
                          padding: const EdgeInsets.symmetric(
                              vertical: 15), // Padding vertical
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Bordes redondeados
                          ),
                        ),
                        onPressed: (){
                          context.push('/auth/register');
                        },
                        child: const Text(
                          'Empezar',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String subCaption;
  final String imageUrl;

  const _Slide(
      {required this.title,
      required this.caption,
      required this.subCaption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'StenbergITC',
                  fontSize: 24,
                  color: Color(0XFFEC1424)),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment:  Alignment.center,
            child: Center(
              child: Text(
                caption,
                style: TextStyle(
                  fontFamily: 'Komet',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              subCaption,
              style: TextStyle(
                  fontFamily: 'StenbergITC',
                  fontSize: 20,
                  color: Color(0XFFFFAA02)),
            ),
          )
        ],
      )),
    );
  }
}
