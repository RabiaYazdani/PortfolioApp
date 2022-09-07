import 'dart:ui';
import 'package:flutter/material.dart';
import '../Widgets/selectable_widget.dart';

class ProjectDetailWidget extends StatefulWidget {
  const ProjectDetailWidget(
      {Key? key,
      required this.content,
      required this.title,
      required this.otherImages,
      required this.image,
      required this.desktopView})
      : super(key: key);
  final String title;
  final String image;
  final String content;
  final List<String> otherImages;
  final bool desktopView;
  @override
  State<ProjectDetailWidget> createState() => _ProjectDetailWidgetState();
}

class _ProjectDetailWidgetState extends State<ProjectDetailWidget> {
  String updatedImageUrl = "";
  bool selected = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: updatedImageUrl != ""
                        ? Image.network(updatedImageUrl, fit: BoxFit.fill)
                        : Image.network(widget.image, fit: BoxFit.fill)),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: mediaQuery.height * 0.25,
                    width: widget.desktopView
                        ? mediaQuery.width * 0.7
                        : mediaQuery.width,
                    padding: widget.desktopView
                        ? EdgeInsets.only(
                            left: mediaQuery.width * 0.04,
                            right: mediaQuery.width * 0.03)
                        : null,
                    child: ScrollConfiguration(
                      behavior: MyCustomScrollBehavior(),
                      child: ListView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < widget.otherImages.length; i++)
                            SelectableImage(
                              isSelected: selectedIndex == i,
                              onTap: (selectedImageIndex) {
                                setState(() {
                                  selectedIndex = i;
                                  updatedImageUrl = widget.otherImages[i];
                                });
                              },
                              imageAsset: widget.otherImages[i],
                            ),
                        ],
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              Text(
                widget.content,
                textAlign: TextAlign.justify,
              )
            ]));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
