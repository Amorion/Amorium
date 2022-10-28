import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 40, top: 75, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Emma Watson, 20",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
                ),
              ),
              Text(
                "She/her",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Icon(
            CupertinoIcons.info,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
