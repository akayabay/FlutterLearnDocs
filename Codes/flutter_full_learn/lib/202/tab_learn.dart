import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/11)image_learn.dart';
import 'package:flutter_full_learn/101/20)text_field_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          appBar: AppBar(),
          body: _tabBarView(),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            shape: const CircularNotchedRectangle(),
            child: _tabBar(),
          ),
          extendBody: true, // Floating action button altına boşluğu verir
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(_MyTabViews.home.index);
            },
            shape: const CircleBorder(
                eccentricity: 0.5, side: BorderSide(width: 2, strokeAlign: BorderSide.strokeAlignOutside)),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ));
  }

  TabBar _tabBar() {
    return TabBar(
      controller: _tabController,
      padding: EdgeInsets.zero,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name.toUpperCase())).toList(),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(), // Sayfalar arası ekran kaydırmayı kapatır
        controller: _tabController,
        children: const [
          ImageLearn(),
          TextFieldLearn(),
          ImageLearn(),
          TextFieldLearn(),
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewsExtansion on _MyTabViews {}
