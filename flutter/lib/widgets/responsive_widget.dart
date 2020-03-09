
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largestScreen;
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final Widget smallestScreen;

  const ResponsiveWidget(
      {Key key,
        @required this.largestScreen,
        this.largeScreen,
        this.mediumScreen,
        this.smallestScreen,
        this.smallScreen})
      : super(key: key);

  static bool isSmallestScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 400;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 500 && MediaQuery.of(context).size.width > 400;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.width < 600;
  }
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600 && MediaQuery.of(context).size.width < 800;
  }
  static bool isLargestScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return largestScreen;
        } else if (constraints.maxWidth < 800 && constraints.maxWidth > 600) {
          return largeScreen;
        } else if (constraints.maxWidth < 600 && constraints.maxWidth > 500) {
          return mediumScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}