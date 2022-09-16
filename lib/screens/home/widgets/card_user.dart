import 'package:amorium/screens/home/widgets/about_box.dart';
import 'package:amorium/screens/home/widgets/custom_sliver.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverAppBarDelegate(),
        ),
        const AboutBox(),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.yellow,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
