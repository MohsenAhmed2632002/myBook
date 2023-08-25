import 'package:flutter/material.dart';
import 'package:mybook/Featuer/home/presentation/views/HomePage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  void initState() {
    super.initState();
    AnimaitonSplash();
    Future.delayed(
      Duration(
        seconds: 2,
      ),
      () {
        Get.to(() => MyHomePage(), transition: Transition.fadeIn);
      },
    );
  }

  void AnimaitonSplash() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(
        0,
        100,
      ),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    slideAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: slideAnimation,
        child: Image.asset(
          "assets/images/Logo.png",
        ),
      ),
    );
  }
}
