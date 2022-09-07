import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../DataModel/image_data.dart';
import '../Widgets/projectDetailWidget.dart';
import '../Widgets/close_button.dart';
import '../Widgets/open_drawer_button.dart';
import '../Widgets/side_layout.dart';
import '../app_colors.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key, required this.data}) : super(key: key);
  final ImageData data;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  );
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0.0, end: 0.1).animate(_controller);
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
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget? child) =>
                            Container(
                                color: AppColor.backgroundColor,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    const CloseButtonWidget(),
                                    const SizedBox(height: 20),
                                    ProjectDetailWidget(
                                      title: widget.data.projectTitle,
                                      content: widget.data.content,
                                      image: widget.data.imageUrl,
                                      otherImages: widget.data.relatedImages,
                                      desktopView: true,
                                    ),
                                  ]),
                                )),
                      ))
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
                  ProjectDetailWidget(
                    title: widget.data.projectTitle,
                    content: widget.data.content,
                    image: widget.data.imageUrl,
                    otherImages: widget.data.relatedImages,
                    desktopView: false,
                  ),
                ]));
          }
        }));
  }
}
