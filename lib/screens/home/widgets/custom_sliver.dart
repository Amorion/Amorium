import 'dart:math';

import 'package:flutter/material.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  BuildContext ctx;
  CustomSliverAppBarDelegate(this.ctx) : super();
  @override
  double get maxExtent => MediaQuery.of(ctx).size.height * 0.6;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final expendPercentage =
        1.0 - min(1, shrinkOffset / (maxExtent - minExtent));

    final interpolatedBackgroundColor = Color.lerp(
      Colors.white,
      Colors.red,
      expendPercentage,
    );
    final interpolatedAlignment = Alignment.lerp(
      Alignment.bottomLeft,
      Alignment.centerRight,
      expendPercentage,
    );
    final interpolatedTextStyle = TextStyle.lerp(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: Colors.yellow,
      ),
      expendPercentage,
    );

    return Container(
      height: minExtent + (maxExtent - minExtent) * expendPercentage,
      color: interpolatedBackgroundColor,
      alignment: interpolatedAlignment,
      child: Text(
        'Photo transition here',
        style: interpolatedTextStyle,
      ),
    );
  }
}
