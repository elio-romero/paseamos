import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paseamos/presentation/signup/view/find_my_partners.dart';
import 'package:paseamos/presentation/ui_params/miflutterapp_sizes.dart';
import 'package:paseamos/presentation/shared/rounded_button.dart';
import 'package:paseamos/presentation/shared/rounded_input_field.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  static const name = 'login';
  const LoginPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  selectFile() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    // source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);

    if (file != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.08),
              Image.asset(
                "assets/images/HomePage.png",
                height: size.height * 0.35,
              ),
              const SizedBox(
                height: MiFlutterAppSizes.normalSpace,
              ),
              RoundedInputField(
                hintText: "Your name",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: MiFlutterAppSizes.normalSpace,
              ),
              if (imageFile != null)
                // Flexible(
                //   child: Image.network(
                Image.network(
                  imageFile!.path,
                  height: size.height * 0.35,
                  fit: BoxFit.cover,
                ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: TextButton.icon(
                      onPressed: () async {
                        XFile? file = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        // source: ImageSource.gallery, maxHeight: 1800, maxWidth: 1800);

                        if (file != null) {
                          setState(() {
                            imageFile = File(file.path);
                          });
                        }
                        // await selectFile();
                      },
                      // heroTag: 'media',
                      // tooltip: 'Pick Single Media from gallery',
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Pick Single Media from gallery'),
                    ),
                  ),
                  if (_picker.supportsImageSource(ImageSource.camera))
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: TextButton.icon(
                        onPressed: () async {
                          await selectFile();
                        },
                        // heroTag: 'image2',
                        // tooltip: 'Take a Photo',
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Take a Photo'),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: MiFlutterAppSizes.normalSpace,
              ),
              RoundedButton(
                text: "Ingresar",
                press: () => context.goNamed(WifiAP.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
