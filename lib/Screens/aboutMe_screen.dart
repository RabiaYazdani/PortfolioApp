import 'package:flutter/material.dart';

import '../Widgets/side_layout.dart';
import '../Widgets/close_button.dart';
import '../app_colors.dart';
import '../Widgets/open_drawer_button.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldState,
        drawer: const Drawer(child: SideLayout()),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth >= 880) {
            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  const SideLayout(),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Container(
                          color: AppColor.backgroundColor,
                          child: ListView(children: const [
                            CloseButtonWidget(),
                            SizedBox(height: 20),
                            AboutMeContent()
                          ])))
                ]));
          } else {
            return Container(
                color: AppColor.backgroundColor,
                child: ListView(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OpenDrawerButton(scaffoldState: scaffoldState),
                      const CloseButtonWidget(),
                    ],
                  ),
                  const AboutMeContent(),
                ]));
          }
        }));
  }
}

class AboutMeContent extends StatelessWidget {
  const AboutMeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Me',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Image.network('https://picsum.photos/seed/image003/500/300'),
          ),
          const SizedBox(height: 20),
          const Text(
            TextConstants.textLong,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
