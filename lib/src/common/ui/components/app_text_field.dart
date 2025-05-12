import 'package:flutter/material.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';

class AppTextField extends StatefulWidget {
  final bool isHidden;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    this.isHidden = false,
    this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isHidden;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged, // ← добавлено
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colors.minorElevatedButtonBg,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: context.colors.minorText),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        isDense: true,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        suffixIcon: widget.isHidden
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: context.colors.minorText,
          ),
          onPressed: () {
            setState(() => _obscureText = !_obscureText);
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 24,
        )
            : null,
      ),
    );
  }
}
