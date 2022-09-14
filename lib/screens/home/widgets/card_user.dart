import 'package:amorium/common/widgets/touchable_opacity.dart';
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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 20.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: 400,
                color: Colors.amber,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Gilroy", fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "20",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Age",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "174",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("cm"),
                              ],
                            ),
                            const Text(
                              "Height",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.female,
                              size: 34,
                            ),
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
