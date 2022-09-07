import 'package:flutter/material.dart';

import 'package:web_app/Screens/aboutMe_screen.dart';
import 'package:web_app/Screens/certification_screen.dart';
import 'package:web_app/Screens/contactMe_screen.dart';

import '../app_colors.dart';

class SideLayout extends StatelessWidget {
  const SideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColor.backgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
            radius: 80,
            // backgroundImage: AssetImage('assets/images/userImage.jpg'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/userImage.jpg',
                  fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 30),
          const Text(TextConstants.shortSelfDescription,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600)),
          const Spacer(),
          Row(
            children: const [
              ActionButton(
                  label: "Certification",
                  screen: CertificationScreen(),
                  color: AppColor.certificationButtonColor),
              SizedBox(width: 10),
              ActionButton(
                  label: "Contact Me",
                  screen: ContactMeScreen(),
                  color: AppColor.contactMeButtonColor),
              SizedBox(width: 10),
              ActionButton(
                  label: "About Me",
                  screen: AboutMeScreen(),
                  color: AppColor.aboutMeButtonColor),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.screen,
      required this.label,
      required this.color})
      : super(key: key);
  final String label;
  final Color color;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => screen)),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 8.5,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
