import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String label;
  final String? defaultValue; // Add this line
  const AppInput(
      {super.key,
      this.controller,
      this.validator,
      required this.label,
      this.defaultValue,
      this.isPassword = false});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  String? _errorMessage;
  bool _isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void initState() {
    super.initState();
    // Initialize the controller's text with the provided value
    widget.controller?.text = widget.defaultValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final _error = _errorMessage != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          cursorColor: Colors.amber,
          obscureText: widget.isPassword ? !_isPasswordVisible : false,
          controller: widget.controller,
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.green),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(20)),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.green),
            // ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  )
                : null,
            hintText: _error ? null : widget.label,
            hintStyle: const TextStyle(color: Colors.red),
            errorStyle: const TextStyle(fontSize: 0.1, height: 0),
            labelText: widget.label,

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
          ),
          validator: (value) {
            final error = widget.validator?.call(value);

            setState(() {
              _errorMessage = error;
            });

            return error;
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          _error ? _errorMessage! : '',
          style: const TextStyle(
            fontSize: 14.0, // Desired font size
            color: Colors.red, // Desired color
          ),
        )
      ],
    );
  }
}
