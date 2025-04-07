import 'package:flutter/material.dart';
import 'package:flutter_travel_app/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.profileScreenTop.image(),
            SizedBox(height: 10,),
            Assets.images.profileScreenPublication.image(),
            SizedBox(height: 10,),
            Assets.images.publication.image(),
            SizedBox(height: 10,),
            Assets.images.publication.image(),
            SizedBox(height: 10,),
            Assets.images.publication.image(),
            SizedBox(height: 10,),
            Assets.images.publication.image(),
          ],
        ),
      ),
    );
  }
}
