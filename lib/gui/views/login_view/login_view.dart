import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/gui/views/login_view/form_login_view.dart';
import 'package:prueba_seleccion_tyba/gui/widgets/primary_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FormLoginView(),
              const SizedBox(height: 20.0),
              RichText(
                text: TextSpan(
                  text: 'No tienes cuenta?',
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: ' Regístrate',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600),
                      recognizer: goToRegister()
                    )
                  ]
                )
              ),
              const SizedBox(height: 15.0),
              PrimaryButton(text: 'Siguiente', onPressed: () {})
            ]
          ),
        ),
      ),
    );
  }

  TapGestureRecognizer goToRegister() {
    return TapGestureRecognizer()..onTap = (() => Navigator.pushNamed(context, 'register'));
  }

}