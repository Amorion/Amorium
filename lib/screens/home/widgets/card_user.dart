import 'package:amorium/common/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Card(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://media.glamour.com/photos/62c451524cef9e141c95d93f/master/w_2560%2Cc_limit/1406845793',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: TouchableOpacity(
              onTap: () {},
              child: const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.diamond,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
