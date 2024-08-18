import 'package:benmore_amos/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;
  final String? prefixIcon;

  final Widget? suffixIcon;

  final FormFieldValidator<String>? validator;
  final bool? obscureText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon = '',
      this.suffixIcon,
      this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        prefixIcon: prefixIcon!.isNotEmpty ? IconButton(
          icon: SvgPicture.asset(
                  prefixIcon!,
                  height: 24,
                  colorFilter: ColorFilter.mode(Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn),
                ),
          onPressed: null,
        ): null,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).textTheme.bodyMedium!.color!,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: athensGrey,
            ),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder:
            OutlineInputBorder(borderSide: const BorderSide(color: athensGrey), borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
