import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';

class TopItem extends StatelessWidget {
  const TopItem({
    super.key,
    required this.title,
    required this.views,
    required this.index,
  });

  final String title;
  final int views;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 110,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFFD9D9D9),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            if (index == 1)
              badge.Badge(
                badgeStyle: const badge.BadgeStyle(
                  shape: badge.BadgeShape.instagram,
                  badgeColor: Color(0xFFBD0002),
                  padding: EdgeInsets.all(8),
                  elevation: 4,
                ),
                badgeContent: Text(
                  '$index',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: -0.075,
                  ),
                ),
              )
            else
              Text(
                '$index',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: -0.075,
                ),
              ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 205 * (MediaQuery.of(context).size.width / 390),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.075,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '$views Views',
                  style: const TextStyle(
                    color: Color(0xFFA7A7A7),
                    fontSize: 12,
                    letterSpacing: -0.06,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
