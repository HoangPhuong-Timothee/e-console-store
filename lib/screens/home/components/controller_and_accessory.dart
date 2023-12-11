import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/screens/home/components/section_title.dart';
import 'package:e_console_store/screens/product/controllerandaccessory_screen.dart';
import 'package:flutter/material.dart';

class ControllerAndAccessory extends StatelessWidget {
  const ControllerAndAccessory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Controller & Accessory",
            pressSeeAll: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ControllerAndAcessoryScreen(),
                  ));
            },
          ),
        ),
        //logic here
      ],
    );
  }
}
