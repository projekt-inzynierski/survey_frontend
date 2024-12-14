import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final InputDecoration? decoration;
  final void Function(String)? onChanged;
  final String? initialValue;
  final String? Function(String?)? validator;

  const PasswordFormField(
      {super.key,
      this.onChanged,
      this.initialValue,
      this.validator,
      this.decoration});

  @override
  State<StatefulWidget> createState() {
    return _PasswordFormFieldState();
  }
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: widget.decoration?.copyWith(
          suffixIcon: IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      )),
    );
  }
}
