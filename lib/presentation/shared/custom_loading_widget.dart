import 'package:flutter/material.dart';
import 'package:paseamos/presentation/ui_params/colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MiFlutterAppColors.primaryColor,
            MiFlutterAppColors.secondaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: MiFlutterAppColors.primaryColor,
        ),
      ),
    );
  }
}
