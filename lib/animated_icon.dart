import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  bool isPlaying = false;
  void _playAnimatedIcon() {
    if (isPlaying == false) {
      _animationController.forward();
      isPlaying = true;
    } else {
      _animationController.reverse();
      isPlaying = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _playAnimatedIcon,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedIcon(
              size: 150,
              icon: AnimatedIcons.home_menu,
              progress: _animationController,
            ),
          ),
        ),
      ),
    );
  }
}
