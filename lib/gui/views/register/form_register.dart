import 'package:flutter/material.dart';
import 'package:prueba_seleccion_tyba/gui/widgets/input_border_widget.dart';

class FormRegisterView extends StatefulWidget {
  const FormRegisterView({ Key? key }) : super(key: key);

  @override
  State<FormRegisterView> createState() => _FormRegisterViewState();
}

class _FormRegisterViewState extends State<FormRegisterView> {
  bool _passwordVisible = true;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecorations.inputDecoration(labelText: 'Email')
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          obscureText: _passwordVisible,
          decoration: InputDecorations.inputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible
              ? Icons.visibility
              : Icons.visibility_off
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}