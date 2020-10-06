library overlayer;

import 'package:flutter/widgets.dart';

class OverlayablePlaceholder extends StatefulWidget {
  final Widget placeholder;
  final Widget overlay;
  OverlayablePlaceholder({this.placeholder, this.overlay}) : super();

  @override
  State createState() => _OverlayablePlaceholderState();
}

class _OverlayablePlaceholderState extends State<OverlayablePlaceholder> {
  final LayerLink link = LayerLink();
  OverlayState overlay;
  OverlayEntry entry;

  @override
  void initState() {
    super.initState();
    overlay = Overlay.of(context);
    entry = OverlayEntry(builder: (context) {
      return CompositedTransformFollower(link: link, child: widget.overlay);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      overlay.insert(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.placeholder;
  }

  @override
  void dispose() {
    super.dispose();
    entry?.remove();
  }
}

extension WidgetOverlayable on Widget {
  OverlayablePlaceholder overlaid(Widget overlay) {
    return OverlayablePlaceholder(placeholder: this, overlay: overlay);
  }
}
