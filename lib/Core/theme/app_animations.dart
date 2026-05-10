import 'package:flutter/material.dart';

import 'package:visibility_detector/visibility_detector.dart';

// ── Animation Constants ───────────────────────────────────────────
class AppDurations {
  static const fast = Duration(milliseconds: 200);
  static const medium = Duration(milliseconds: 400);
  static const slow = Duration(milliseconds: 600);
  static const entrance = Duration(milliseconds: 700);
  static const hero = Duration(milliseconds: 900);
  static const staggerDelay = Duration(milliseconds: 100);
}

class AppCurves {
  static const entrance = Curves.easeOutCubic;
  static const smooth = Curves.easeInOutCubic;
  static const bounce = Curves.elasticOut;
  static const decelerate = Curves.decelerate;
}

// ── Animate on Scroll Wrapper ─────────────────────────────────────
class AnimateOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset slideOffset;
  final double visibleThreshold;

  const AnimateOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
    this.slideOffset = const Offset(0, 30),
    this.visibleThreshold = 0.15,
  });

  @override
  State<AnimateOnScroll> createState() => _AnimateOnScrollState();
}

class _AnimateOnScrollState extends State<AnimateOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;
  bool _hasAnimated = false;
  late final Key _detectorKey;

  @override
  void initState() {
    super.initState();
    _detectorKey = UniqueKey();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _opacity = CurvedAnimation(
      parent: _controller,
      curve: AppCurves.entrance,
    );
    _offset = Tween<Offset>(
      begin: widget.slideOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: AppCurves.entrance,
    ));
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimated && info.visibleFraction >= widget.visibleThreshold) {
      _hasAnimated = true;
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _detectorKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacity.value,
            child: Transform.translate(
              offset: _offset.value,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// ── Staggered List Animation ──────────────────────────────────────
class StaggeredList extends StatelessWidget {
  final List<Widget> children;
  final Duration staggerDelay;
  final Duration itemDuration;
  final Axis direction;

  const StaggeredList({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 80),
    this.itemDuration = const Duration(milliseconds: 500),
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < children.length; i++)
          AnimateOnScroll(
            delay: staggerDelay * i,
            duration: itemDuration,
            child: children[i],
          ),
      ],
    );
  }
}

// ── Hover Scale Effect ────────────────────────────────────────────
class HoverScaleEffect extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;

  const HoverScaleEffect({
    super.key,
    required this.child,
    this.scale = 1.03,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverScaleEffect> createState() => _HoverScaleEffectState();
}

class _HoverScaleEffectState extends State<HoverScaleEffect> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scale : 1.0,
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    );
  }
}
