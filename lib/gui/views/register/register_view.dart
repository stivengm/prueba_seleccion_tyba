import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/gui/views/register/form_register.dart';
import 'package:prueba_seleccion_tyba/gui/widgets/primary_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back
          ),
          color: Colors.grey,
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FormRegisterView(),
              const SizedBox(height: 20.0),
              PrimaryButton(text: 'Registrarse', onPressed: () {})
            ]
          ),
        ),
      ),
    );
  }
}