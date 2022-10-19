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
        body: Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: SwipeCards(
        matchEngine: _matchEngine,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://media.glamour.com/photos/62c451524cef9e141c95d93f/master/w_2560%2Cc_limit/1406845793',
                    fit: BoxFit.cover,
                    height: size.height * 0.49,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.yellow),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "About me",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 20, right: 50),
                          child: Text(
                            "I like catching bugs, sometimes also date them.",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
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
    ));
  }
}
