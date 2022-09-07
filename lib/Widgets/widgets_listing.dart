import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hovering/hovering.dart';
import 'package:web_app/app_colors.dart';
import 'package:web_app/DataModel/image_data.dart';

import '../DataModel/image_data.dart';
import '../Screens/ProjectScreen.dart';

class WidgetListing extends StatefulWidget {
  const WidgetListing({Key? key}) : super(key: key);

  @override
  State<WidgetListing> createState() => _WidgetListingState();
}

class _WidgetListingState extends State<WidgetListing>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    // final animation = Tween(begin: 0.0, end: 0.1).animate(_controller);
    return Column(
      children: [
        StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            children: List.generate(imageList.length, (index) {
              return HoverWidget(
                onHover: (event) {
                  setState(() {
                    hovered = true;
                  });
                },
                hoverChild: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SelectCard(choice: imageList[index]),
                    Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            imageList[index].projectTitle,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        ProjectScreen(data: imageList[index])

                                    // transitionsBuilder: (context, animation,
                                    //     secondaryAnimation, child) {
                                    //   return FadeTransition(
                                    //     opacity: animation,
                                    //     child: child,
                                    //   );
                                    // },
                                    ));
                              },
                              child: const Text(
                                'View',
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                child: SelectCard(choice: imageList[index]),
              );
            }))
      ],
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final ImageData choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shadowColor: AppColor.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(choice.imageUrl)));
  }
}
