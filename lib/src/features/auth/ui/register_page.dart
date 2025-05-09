import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel_app/resources/resources.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/features/auth/ui/widgets/auth_text_field.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.colors.mainBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                SvgPicture.asset(
                  AppVectors.maps,
                  height: 110,
                ),
                Text(
                  context.strings.registerTitle,
                  style: AppFonts.mainTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                AuthTextField(
                  hintText: context.strings.emailHint,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.strings.emailEmptyError;
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return context.strings.emailInvalidError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AuthTextField(
                  hintText: context.strings.passwordHint,
                  isHidden: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.strings.passwordEmptyError;
                    }
                    if (value.length < 6) {
                      return context.strings.passwordTooShortError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AuthTextField(
                  hintText: context.strings.confirmPasswordHint,
                  isHidden: true,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.strings.confirmPasswordEmptyError;
                    }
                    if (value != _passwordController.text) {
                      return context.strings.passwordsNotMatchError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: AppElevatedButton.main(
                    child: Text(context.strings.registerButton),
                    onPressed: _submit,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //context.goNamed(AppRoutes.loginName);
                  },
                  child: Text(
                    context.strings.alreadyHaveAccount,
                    style: AppFonts.title
                        .copyWith(color: context.colors.minorText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
