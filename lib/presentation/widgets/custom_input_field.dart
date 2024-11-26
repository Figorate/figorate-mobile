import 'package:figorate_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final Color? labelColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? textColor; 
  final double? borderRadius;
  final double? height;
  final Widget? prefixIcon;

  const CustomInputField({
    super.key,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.onChanged,
    this.labelColor,
    this.hintColor,
    this.borderColor,
    this.textColor,
    this.borderRadius = 8,
    this.height,
    this.prefixIcon,
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
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.hintColor ?? AppColors.grey),
          labelStyle: TextStyle(color: widget.labelColor ?? AppColors.black),
          errorText: widget.errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!.r),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.grey),
          ),
          prefixIcon: widget.prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!.r),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!.r),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.green),
          ),
        ),
        style: TextStyle(color: widget.textColor ?? AppColors.black),
        obscureText: _isObscure,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
      ),
    );
  }
}
