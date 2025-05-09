import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel_app/resources/resources.dart';
import 'package:flutter_travel_app/src/common/ui/components/app_elevated_button.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_colors.dart';
import 'package:flutter_travel_app/src/common/ui/theme/app_fonts.dart';
import 'package:flutter_travel_app/src/l10n/context_extensions.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.mainBg,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              AppVectors.bigTravellingCat,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Text(
                  context.strings.welcomeTitle,
                  style: AppFonts.mainTitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
                SizedBox(
                  width: double.infinity,
                  child: AppElevatedButton.main(
                    onPressed: () {},
                    //onPressed: () => context.pushNamed(AppRoutes.loginName),
                    child: Text(context.strings.loginButton),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: AppElevatedButton.main(
                    color: context.colors.extraMainElevatedButtonBg,
                    onPressed: () {},
                    //onPressed: () => context.pushNamed(AppRoutes.registerName)
                    child: Text(context.strings.registerButton),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
