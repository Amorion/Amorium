import 'package:amorium/common/widgets/touchable_opacity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}

class Swiper extends StatefulWidget {
  const Swiper({Key? key}) : super(key: key);

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  final List<SwipeItem> _swipeItems = [];

  late MatchEngine _matchEngine;

  final List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            // TODO
          },
          nopeAction: () {
            // TODO
          },
          superlikeAction: () {
            // TODO
          },
          onSlideUpdate: (SlideRegion? region) async {
            // TODO
          },
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: size.height * 0.7,
                child: Stack(
                  children: [
                    SwipeCards(
                      matchEngine: _matchEngine,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Card(
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          'https://media.glamour.com/photos/62c451524cef9e141c95d93f/master/w_2560%2Cc_limit/1406845793',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Emma Watson, 30",
                                            style: TextStyle(
                                              fontSize: 40,
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "She/her",
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      onStackFinished: () {
                        // TODO
                      },
                      itemChanged: (SwipeItem item, int index) {
                        // TODO
                      },
                      upSwipeAllowed: true,
                      fillSpace: true,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: TouchableOpacity(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 40,
                          child: Icon(
                            CupertinoIcons.heart,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
