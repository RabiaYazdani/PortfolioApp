import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../Widgets/close_button.dart';
import '../Widgets/side_layout.dart';
import '../Widgets/open_drawer_button.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({Key? key}) : super(key: key);

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
            child: Row(
              children: [
                const SideLayout(),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: AppColor.backgroundColor,
                    child: ListView(
                      children: const [
                        CloseButtonWidget(),
                        Center(
                          child: Text("Certification Screen"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(
            color: AppColor.backgroundColor,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OpenDrawerButton(scaffoldState: scaffoldState),
                    const CloseButtonWidget(),
                  ],
                ),
                const Center(
                  child: Text("Certification Screen"),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
