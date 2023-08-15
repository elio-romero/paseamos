import 'package:flutter/material.dart';
import 'package:paseamos/presentation/shared/rounded_button.dart';

class FormPlayer extends StatefulWidget {
  const FormPlayer({super.key});

  @override
  _FormPlayerState createState() => _FormPlayerState();
}

class _FormPlayerState extends State<FormPlayer> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _nombreController;
  TextEditingController? _apellidoController;
  TextEditingController? _edadController;
  TextEditingController? _dniController;

  @override
  void initState() {
    super.initState();

    _nombreController = TextEditingController(text: '');
    _apellidoController = TextEditingController(text: '');
    _edadController = TextEditingController(text: '');
    _dniController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingreso de jugadores'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombres'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresar nombres';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(labelText: 'Apellidos'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresar apellidos';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: _edadController,
                      decoration: const InputDecoration(labelText: 'Edad'),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _dniController,
                      decoration: const InputDecoration(
                          labelText: 'Documento de Identidad'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              RoundedButton(
                text: 'Ingresar jugador',
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
