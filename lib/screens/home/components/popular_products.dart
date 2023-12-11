import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/screens/home/components/section_title.dart';
import 'package:e_console_store/screens/product/popular_screen.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular",
            pressSeeAll: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopularScreen(),
                  ));
            },
          ),
        ),
        //logic here
      ],
    );
  }
}
