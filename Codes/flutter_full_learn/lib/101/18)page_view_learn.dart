import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/11)image_learn.dart';
import 'package:flutter_full_learn/101/16)stack_learn.dart';
import 'package:flutter_full_learn/101/6)%C4%B1con_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.8);// Yanda olan komponentin ufak bir bölümünü gösterir
  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _pageController, 
        padEnds: false,
        onPageChanged: _updatePageIndex,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const StackLearn(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("$_currentPageIndex"),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              // Controller kısmının setState() içerisinde yazılmamasının sebebi zaten kendisinin ayrı bir statefull widget olmasıdır
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.linear);
            },
            child: const Icon(Icons.chevron_left),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.linear);
            },
            child: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = const Duration(milliseconds: 300);
}
