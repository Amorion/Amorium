import 'package:amorium/common/utils/utils.dart';
import 'package:amorium/screens/home/widgets/card_widgets.dart';
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
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageCard(
                      size: size,
                      imageUrl:
                          'https://media.glamour.com/photos/62c451524cef9e141c95d93f/master/w_2560%2Cc_limit/1406845793',
                    ),
                    const PromptCard(
                      heading: "About Me",
                      content:
                          "I like catching bugs, sometimes also date them.",
                    ),
                    ImageCard(
                        size: size,
                        imageUrl:
                            'https://i.pinimg.com/originals/64/95/d0/6495d05033eb2029300f4a6fe5151952.jpg'),
                    const PromptCard(
                        heading: "What i like?",
                        content: "Singing, Gym, Swimming"),
                    ImageCard(
                        size: size,
                        imageUrl:
                            "https://i.pinimg.com/originals/64/95/d0/6495d05033eb2029300f4a6fe5151952.jpg")
                  ],
                ),
              ),
            );
          },
          onStackFinished: () {
            showSnackBar(
                context: context, content: "Stack Over, get a life bruh!");
          },
          itemChanged: (SwipeItem item, int index) {},
          upSwipeAllowed: false,
          fillSpace: false,
        ),
      ),
    );
  }
}
