// ignore_for_file: prefer_typing_uninitialized_variables, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/11)image_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});
  final _title = "Crate Your First Note";
  final _subtitle = "Add a note ";
  final _createNote = "Create a Note";
  final _importNote = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NoteDemosColors.backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: NoteDemosColors.appBarColor,
      ),
      body: Center(
        child: Padding(
          padding: NotDemosPadding().generalHorizontalPaddingValue,
          child: Column(
            children: [
              PngImage(nameWithPath: ImageItems().appleWithBooksPng),
              Padding(
                padding: NotDemosPadding().onlyTop,
                child: _TitleWidget(title: _title),
              ),
              Padding(
                padding: NotDemosPadding().generalVerticalPaddingValue,
                child: _SubtitleWidget(
                  subtitle: _subtitle * 18,
                ),
              ),
              const Spacer(),
              _createButton(context),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    _importNote,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: NoteDemosColors.crateButtonBackgroundColor,
                          fontWeight: FontWeight.w700,
                        ),
                  )),
              const SizedBox(height: ButtonHeigths.buttonNormalHeight),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: NoteDemosColors.crateButtonBackgroundColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: SizedBox(
          height: ButtonHeigths.buttonNormalHeight,
          child: Center(
            child: Text(
              _createNote,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: NoteDemosColors.textColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 1
          ),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({super.key, required this.subtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      subtitle,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: NoteDemosColors.textColor, fontWeight: FontWeight.w500),
    );
  }
}

class NotDemosPadding {
  final generalHorizontalPaddingValue =
      const EdgeInsets.symmetric(horizontal: 20);
  final generalVerticalPaddingValue = const EdgeInsets.symmetric(vertical: 13);
  final onlyTop = const EdgeInsets.only(top: 13);
}

class ButtonHeigths {
  static const double buttonNormalHeight = 65;
}

class NoteDemosColors {
  static final backgroundColor = Colors.blueGrey[50];
  static final crateButtonBackgroundColor = Colors.blueAccent.shade400;
  static const textColor = Colors.black87;
  static const appBarColor = Colors.transparent;
}
