import 'package:e_console_store/constants/constants.dart';
import 'package:e_console_store/screens/home/components/section_title.dart';
import 'package:e_console_store/screens/product/new_screen.dart';
import 'package:flutter/material.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewScreen(),
                  ));
            },
          ),
        ),
        //logic here
      ],
    );
  }
}
