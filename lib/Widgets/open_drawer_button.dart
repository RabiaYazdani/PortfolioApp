import 'package:flutter/material.dart';

class OpenDrawerButton extends StatelessWidget {
  const OpenDrawerButton({Key? key, required this.scaffoldState})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldState;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () {
            scaffoldState.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu)),
    );
  }
}
