import 'package:flutter/material.dart';

class WidgetToImage extends StatefulWidget {
  final Widget Function(GlobalKey key) builder;
  const WidgetToImage({Key? key, required this.builder}) : super(key: key);

  @override
  State<WidgetToImage> createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // Wrap with RepaintBoundary
    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
    );
  }
}
