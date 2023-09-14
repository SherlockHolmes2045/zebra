import 'package:flutter/material.dart';
import 'package:zebra/app/widgets/badge.dart';

class ComicItem extends StatelessWidget {
  const ComicItem({
    super.key,
    required this.title,
    required this.issue,
    this.type = ComicItemType.normal,
    this.badge,
  });

  final String title;
  final int issue;
  final ComicItemType type;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: type == ComicItemType.normal
            ? 144
            : type == ComicItemType.exclusive
                ? 255
                : 117,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: type == ComicItemType.normal
                    ? 224
                    : type == ComicItemType.exclusive
                        ? 357
                        : 117,
                alignment: type == ComicItemType.normal
                    ? Alignment.bottomLeft
                    : Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: type == ComicItemType.normal
                      ? const Color(0xFFC4C4C4)
                      : type == ComicItemType.exclusive
                          ? Colors.red
                          : const Color(0xFF808080),
                  gradient: type == ComicItemType.exclusive
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 1],
                          colors: [Colors.grey.shade900, Colors.grey],
                        )
                      : null,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.only(
                    bottom: type == ComicItemType.exclusive ? 15 : 5,
                    left: 5,
                    right: 5),
                child: type == ComicItemType.normal
                    ? badge != null
                        ? ZebraBadge(
                            color: const Color(0xffbc0001),
                            text: badge!,
                          )
                        : const SizedBox.shrink()
                    : type == ComicItemType.exclusive
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.065,
                                ),
                              ),
                              if (badge != null) ...[
                                const SizedBox(
                                  height: 10,
                                ),
                                ZebraBadge(
                                  color: const Color(0xffbc0001),
                                  text: badge!,
                                )
                              ] else
                                const SizedBox.shrink()
                            ],
                          )
                        : const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            child: LinearProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              backgroundColor: Color(0xFFACACAC),
                              value: 0.3,
                            ),
                          )),
            const SizedBox(
              height: 11,
            ),
            if (type != ComicItemType.exclusive)
              Text(
                title,
                overflow: type == ComicItemType.normal
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF808080),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.065,
                ),
              ),
            if (type == ComicItemType.resume)
              Text(
                'Issue $issue',
                style: const TextStyle(
                  color: Color(0xFF808080),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.065,
                ),
              )
          ],
        ),
      ),
    );
  }
}

enum ComicItemType { resume, normal, exclusive, top }
