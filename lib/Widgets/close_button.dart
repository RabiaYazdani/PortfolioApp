import 'package:flutter/material.dart';

import '../Screens/HomeScreen.dart';

class CloseButtonWidget extends StatefulWidget {
  const CloseButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CloseButtonWidget> createState() => _CloseButtonWidgetState();
}

class _CloseButtonWidgetState extends State<CloseButtonWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: IconButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    // position: tween.animate(curvedAnimation),
                    opacity: animation,
                    child: child,
                  );
                },
              ));
            },
            icon: const Icon(Icons.cancel)));
  }
}
