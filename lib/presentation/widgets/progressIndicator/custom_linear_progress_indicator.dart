import 'package:app_template/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    super.key,
    required this.formsStep,
    required this.finalStep,
    required this.colors,
  });

  final int formsStep;
  final int finalStep;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          tween: Tween<double>(
            begin: (formsStep - 1) / finalStep, // Progreso inicial
            end: formsStep / finalStep, // Progreso final
          ),
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 8,
                  child: LinearProgressIndicator(
                    value: value, // Aplicamos la animación suave
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(colors),
                  ),
                ),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomSubtitle(
              text: '$formsStep/$finalStep', 
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }
}
