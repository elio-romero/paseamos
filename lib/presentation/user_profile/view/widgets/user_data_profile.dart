import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../shared/rounded_button.dart';
import '../../../ui_params/miflutterapp_sizes.dart';

class UserDataProfile extends StatelessWidget {
  const UserDataProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: (size.height / 3),
      left: size.width * 0.098,
      right: size.width * 0.098,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: MiFlutterAppSizes.normalSpace,
            ),
            const SizedBox(
              height: MiFlutterAppSizes.normalSpace,
            ),
            SizedBox(
              width: size.width,
              child: TextFormField(
                controller: TextEditingController(text: "12/07/1987"),
                decoration: const InputDecoration(
                  labelText: 'Fecha de nacimiento',
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(
              height: MiFlutterAppSizes.normalSpace,
            ),
            SizedBox(
              width: size.width,
              child: TextFormField(
                controller:
                    TextEditingController(text: "rfernandez86@gmail.com"),
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(
              height: MiFlutterAppSizes.normalSpace,
            ),
            SizedBox(
              width: size.width,
              child: TextFormField(
                controller: TextEditingController(text: "+598 2424 5858"),
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                ),
                readOnly: true,
              ),
            ),
            const SizedBox(
              height: MiFlutterAppSizes.normalSpace,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(MiFlutterAppSizes.borderRadiusButton),
                  ),
                ),
                hintStyle: TextStyle(
                  fontSize: MiFlutterAppSizes.miFlutterAppHintTextSize,
                ),
                fillColor: Colors.white,
              ),
              isExpanded: true,
              hint: const Align(
                alignment: Alignment.center,
                child: FittedBox(
                  child: Text(
                    "Seleccione una opción",
                    style: TextStyle(),
                  ),
                ),
              ),
              onChanged: (String? newValue) {},
              items: genderList.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Center(
                    child: Text(
                      val,
                      style: const TextStyle(),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: MiFlutterAppSizes.normalSpace,
            ),
            RoundedButton(
              text: "Cerrar sesión",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
