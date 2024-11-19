import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PincodeWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? errorText;
  final Color fieldColor;
  final Color borderColor;
  final Color focusedBorderColor;

  const PincodeWidget
({
    super.key,
    required this.onChanged,
    this.errorText,
    required this.fieldColor,
    required this.borderColor,
    required this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final controllers = List.generate(6, (index) => TextEditingController());
    final focusNodes = List.generate(6, (index) => FocusNode());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 40.w,
          height: 50.h,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            obscureText: true,
            obscuringCharacter: '*',
            style: TextStyle(color: fieldColor),
            decoration: InputDecoration(
              counterText: '',
              errorText: index == 5 ? errorText : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: focusedBorderColor),
              ),
            ),
            onChanged: (value) {
              onChanged(value);
              if (value.isNotEmpty && index < 5) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
            },
            onEditingComplete: () {
              if (index == 5) {}
            },
          ),
        );
      }),
    );
  }
}
