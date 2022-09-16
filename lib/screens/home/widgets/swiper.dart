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
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            print("like");
          },
          nopeAction: () {
            print("reject");
          },
          superlikeAction: () {
            print("Super like");
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: _swipeItems[index].content.color,
                  child: Text(
                    _swipeItems[index].content.text,
                    style: const TextStyle(fontSize: 100),
                  ),
                );
              },
              onStackFinished: () {
                print("It's over");
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              upSwipeAllowed: true,
              fillSpace: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    _matchEngine.currentItem?.nope();
                  },
                  child: const Text("Nope")),
              TextButton(
                  onPressed: () {
                    _matchEngine.currentItem?.superLike();
                  },
                  child: const Text("Superlike")),
              TextButton(
                  onPressed: () {
                    _matchEngine.currentItem?.like();
                  },
                  child: const Text("Like"))
            ],
          )
        ],
      ),
    );
  }
}
