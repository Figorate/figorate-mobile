import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final Color? labelColor;

  const CustomInputField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    required this.onChanged,
    this.labelColor,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: widget.labelColor ?? AppColors.black),
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        suffixIcon: widget.obscureText ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
      ),
      obscureText: _isObscure,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
    );
  }
}
