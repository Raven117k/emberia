import 'package:flutter/material.dart';

class FadeScalePageTransitionsBuilder extends PageTransitionsBuilder {
  const FadeScalePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context,
      Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.98, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        child: child,
      ),
    );
  }
}

/// Simple fade-in wrapper that animates when first built.
class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;

  const FadeIn({Key? key, required this.child, this.duration = const Duration(milliseconds: 350), this.curve = Curves.easeOut}) : super(key: key);

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(vsync: this, duration: widget.duration)..forward();
  late final Animation<double> _anim = CurvedAnimation(parent: _ctrl, curve: widget.curve);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(opacity: _anim, child: widget.child);
}

/// Touch feedback that scales its child slightly on tap down/up.
class AnimatedTapScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration duration;

  const AnimatedTapScale({Key? key, required this.child, this.onTap, this.duration = const Duration(milliseconds: 120)}) : super(key: key);

  @override
  _AnimatedTapScaleState createState() => _AnimatedTapScaleState();
}

class _AnimatedTapScaleState extends State<AnimatedTapScale> {
  double _scale = 1.0;

  void _setDown() => setState(() => _scale = 0.98);
  void _setUp() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) => _setDown(),
      onTapUp: (_) {
        _setUp();
        widget.onTap?.call();
      },
      onTapCancel: () => _setUp(),
      child: AnimatedScale(
        scale: _scale,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
