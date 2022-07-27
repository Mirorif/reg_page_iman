import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
Curve _curve = Curves.fastOutSlowIn;

class ExpansionContainer extends StatefulWidget {
  final Widget header;
  final Widget body;
  final Duration duration;
  final double normalHeight;
  final double expandableHeight;
  final bool isScrollable;
  final Decoration decoration;
  final EdgeInsets? margin;
  final EdgeInsets? bodyPadding;
  final Icon? icon;
  final bool isRtl;

  const ExpansionContainer({
    Key? key,
    required this.header,
    required this.body,
    required this.duration,
    this.normalHeight = kToolbarHeight,
    this.expandableHeight = 250,
    this.isScrollable = false,
    required this.decoration,
    this.margin,
    this.bodyPadding,
    this.icon,
    this.isRtl = false,
  })  : assert(
          normalHeight < expandableHeight,
        ),
        super(key: key);

  @override
  State<ExpansionContainer> createState() => _ExpansionContainerState();
}

class _ExpansionContainerState extends State<ExpansionContainer> {
  late bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      curve: _curve,
      height: _expanded ? widget.expandableHeight : widget.normalHeight,
      margin: widget.margin,
      clipBehavior: Clip.antiAlias,
      decoration: widget.decoration,
      child: Directionality(
        textDirection: widget.isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return SizedBox(
      height: widget.normalHeight,
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          splashColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: widget.header,
                  ),
                ),
                TweenAnimationBuilder<double>(
                    curve: _curve,
                    tween: Tween(end: _expanded ? 1 : 0),
                    duration: widget.duration,
                    builder: (BuildContext context, double t, Widget? child) {
                      return Transform.rotate(
                        angle: math.pi * t,
                        child: widget.icon ??
                            const Icon(CupertinoIcons.chevron_down),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: SingleChildScrollView(
        physics: widget.isScrollable
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        padding: widget.bodyPadding,
        child: TweenAnimationBuilder<double>(
          duration: widget.duration,
          tween: Tween(end: _expanded ? 1 : 0),
          curve: _curve,
          builder: (BuildContext context, double t, Widget? child) {
            return AnimatedOpacity(
              duration: widget.duration,
              opacity: t,
              curve: Curves.linear,
              child: Transform.translate(
                offset: Offset.lerp(
                  const Offset(0, 1),
                  Offset.zero,
                  t,
                )!,
                child: widget.body,
              ),
            );
          },
        ),
      ),
    );
  }
}
