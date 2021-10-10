import 'package:flutter/material.dart';

class SlideUpRoute extends PageRouteBuilder {
  final Widget view;
  SlideUpRoute({required this.view})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => view,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}

class SlideDownRoute extends PageRouteBuilder {
  final Widget view;
  SlideDownRoute({required this.view})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => view,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}

class FadeInRoute extends PageRouteBuilder {
  final Widget view;
  FadeInRoute({required this.view})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return view;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity: new Tween<double>(
              begin: 0.2,
              end: 1,
            ).animate(animation),
            child: child,
          );
        });
}
