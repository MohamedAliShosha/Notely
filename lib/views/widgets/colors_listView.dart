import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34, // نص القطر
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38, // نص القطر
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  List<Color> colors = const [
    Color(0xffCCDBDC),
    Color(0xff9AD1D4),
    Color(0xff80CED7),
    Color(0xff007EA7),
    Color(0xff003249),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // To make the height specified
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index; // Update the current index
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive:
                    currentIndex == index, // index is each item in the list
              ),
            ),
          );
        },
      ),
    );
  }
}
