import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LayoutNotifier extends SingleChildRenderObjectWidget {
  final void Function(Offset offset, Size size) listener;

  final bool listenOrientation;

  const LayoutNotifier(
    this.listener, {
    super.child,
    super.key,
    this.listenOrientation = false,
  });

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _LayoutNotifierRenderBox(
        listener,
        listenOrientation: listenOrientation,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _LayoutNotifierRenderBox renderObject,
  ) {
    renderObject.listener = listener;
    if (listenOrientation) {
      renderObject.orientation = MediaQuery.of(context).orientation;
    }
  }
}

class _LayoutNotifierRenderBox extends RenderProxyBox {
  Function(Offset offset, Size size) listener;
  Size? _oldSize;
  Orientation? _oldOrientation;
  Orientation? orientation;

  final bool listenOrientation;

  _LayoutNotifierRenderBox(
    this.listener, {
    this.listenOrientation = false,
  }) : super(null) {
    _onChanged();
  }

  @override
  void performLayout() {
    super.performLayout();
    if (size != _oldSize ||
        (listenOrientation && orientation != _oldOrientation)) {
      _onChanged();
    }
    _oldSize = size;
    _oldOrientation = orientation;
  }

  void _onChanged() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (hasSize) {
        final offset = localToGlobal(Offset.zero);
        final size = this.size;
        listener(offset, size);
      }
    });
  }
}
