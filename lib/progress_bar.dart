import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ProgressBar extends LeafRenderObjectWidget {
  const ProgressBar(
      {Key key, this.barColor, this.thumbColor, this.thumbSize = 20});

  final Color barColor;
  final Color thumbColor;
  final double thumbSize;

  @override
  RenderProgressBar createRenderObject(BuildContext context) {
    return RenderProgressBar(
        barColor: barColor, thumbColor: thumbColor, thumbSize: thumbSize);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderProgressBar renderObject) {
    renderObject
      ..barColor = barColor
      ..thumbColor = thumbColor
      ..thumbSize = thumbSize;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('barColor', barColor));
    properties.add(ColorProperty('thumbColor', thumbColor));
    properties.add(DoubleProperty('thumbSize', thumbSize));
  }
}

class RenderProgressBar extends RenderBox {
  RenderProgressBar({
    Color barColor,
    Color thumbColor,
    double thumbSize,
  })  : _barColor = barColor,
        _thumbColor = thumbColor,
        _thumbSize = thumbSize;

  Color get barColor => _barColor;
  Color _barColor;

  set barColor(Color value) {
    if (_barColor == value) return;
    _barColor = value;
    markNeedsPaint();
  }

  Color get thumbColor => _thumbColor;
  Color _thumbColor;

  set thumbColor(Color value) {
    if (_thumbColor == value) return;
    _thumbColor = value;
    markNeedsPaint();
  }

  double get thumbSize => _thumbSize;
  double _thumbSize;

  set thumbSize(double value) {
    if (_thumbSize == value) return;
    _thumbSize = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = thumbSize;
    final desiredSize = Size(desiredWidth, desiredHeight);
    size = constraints.constrain(desiredSize);
  }
}
