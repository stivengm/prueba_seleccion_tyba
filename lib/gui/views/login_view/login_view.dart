import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/gui/views/login_view/form_login_view.dart';
import 'package:prueba_seleccion_tyba/gui/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const FormLoginView(),
              const SizedBox(height: 20.0),
              PrimaryButton(text: 'Login', onPressed: () {})
            ]
          ),
        ),
      ),
    );
  }
}