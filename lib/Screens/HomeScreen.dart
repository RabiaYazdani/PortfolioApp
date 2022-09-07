import 'package:flutter/material.dart';
import '../Widgets/side_layout.dart';
import '../Widgets/widgets_listing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldState,
        drawer: const Drawer(child: SideLayout()),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 880) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                const SideLayout(),
                const SizedBox(width: 10),
                Expanded(
                  child:
                      ListView(children: const [WidgetListing()]), //your child
                )
              ]),
            );
          } else {
            return ListView(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        scaffoldState.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu))),
              const WidgetListing()
            ]);
          }
        }));
  }
}
