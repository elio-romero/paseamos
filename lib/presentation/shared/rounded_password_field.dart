import 'package:flutter/material.dart';
import 'package:paseamos/presentation/shared/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final bool isConfirmationPassword;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.isConfirmationPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText:
              isConfirmationPassword ? "Confirmation Password" : "Password",
          icon: const Icon(
            Icons.lock,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
