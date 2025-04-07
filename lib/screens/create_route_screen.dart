import 'package:flutter/material.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';
import 'package:flutter_travel_app/router/router.dart';
import 'package:go_router/go_router.dart';

class CreateRouteScreen extends StatelessWidget {
  const CreateRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Assets.images.createRouteScreen.image(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              context.pushNamed(AppRouter.createRoute2Name);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDFA85E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Далее',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
