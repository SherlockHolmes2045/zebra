import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zebra/app/widgets/badge.dart';
import 'package:zebra/app/widgets/comic_item.dart';
import 'package:zebra/app/widgets/top_item.dart';
import 'package:zebra/home/cubit/home_cubit.dart';
import 'package:zebra/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final badges = ['NEW TODAY', null, 'NEW THIS WEEK'];
  final random = Random();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    color: const Color(0xff191919),
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.width / 390) * 110,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            ZebraBadge(
                                color: Color(0xffbc0001), text: 'NEW TODAY'),
                            SizedBox(width: 5),
                            ZebraBadge(
                                color: Color(0x7fffffff), text: 'ACTION'),
                            SizedBox(width: 5),
                            ZebraBadge(
                                color: Color(0x7fffffff), text: 'ACTION'),
                            SizedBox(width: 5)
                          ],
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              reverse: true,
                              initialPage: _currentIndex,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              }),
                          items: [
                            ...List.generate(
                              6,
                              (index) => Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: (MediaQuery.of(context).size.width /
                                            390) *
                                        100,
                                    color: const Color(0xffffffff),
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  const Text(
                                    'This is the comic synopsis which is clickable to open more details about it. Let’s add some new text here.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF83868F),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        DotsIndicator(
                          dotsCount: 6,
                          position: _currentIndex,
                          reversed: true,
                          decorator: DotsDecorator(
                            activeColor: Colors.white,
                            color: const Color.fromRGBO(255, 255, 255, 0.50),
                            size: const Size.square(8),
                            activeSize: const Size(18, 9),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 35),
                    child: Text(
                      'Resume Reading',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.1,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          10,
                          (index) => const ComicItem(
                            title: 'Fantastic Tumbu and where art thou?',
                            issue: 3,
                            type: ComicItemType.resume,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 41),
                    child: Text(
                      'Romance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.1,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          10,
                          (index) => ComicItem(
                            title: 'Fantastic Tumbu and where art thou?',
                            issue: 3,
                            badge: badges[random.nextInt(3)],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 28),
                    child: Text(
                      'Zebra exclusive',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.1,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          10,
                          (index) => ComicItem(
                            title: 'Fantastic Tumbu and where art thou?',
                            issue: 3,
                            badge: badges[random.nextInt(3)],
                            type: ComicItemType.exclusive,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: 390 * (MediaQuery.of(context).size.width / 390),
                    height: 61 * (MediaQuery.of(context).size.width / 390),
                    decoration: const BoxDecoration(
                      color: Color(0xff9747ff),
                    ),
                    child: const Center(
                      child: Text(
                        'Ad',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.065,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 35),
                    child: Text(
                      'Completed series',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.1,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          10,
                          (index) => ComicItem(
                            title: 'Chronicles of Totemism',
                            issue: 3,
                            badge: badges[random.nextInt(3)],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, top: 35),
                    child: Text(
                      'Top series',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.1,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'ACTION',
                                  style: TextStyle(
                                      color: Color(0xFF83868F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.065),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ...List.generate(
                                    3,
                                    (index) => TopItem(
                                          title:
                                              'The Guy Upstairs and a Longer Title as Such',
                                          views: 680,
                                          index: index + 1,
                                        ))
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'ROMANCE',
                                  style: TextStyle(
                                    color: Color(0xFF83868F),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.065,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ...List.generate(
                                    3,
                                    (index) => TopItem(
                                          title:
                                              'The Guy Upstairs and a Longer Title as Such',
                                          views: 680,
                                          index: index + 1,
                                        ))
                              ],
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: Image.asset('assets/images/logo.png'),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16, top: 8),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
