import 'package:PiliPlus/utils/feed_back.dart';
import 'package:flutter/material.dart';

class BackToTopButton extends StatefulWidget {
  const BackToTopButton({
    super.key,
    required this.scrollController,
    this.showAtOffset = 300,
    this.icon = Icons.keyboard_arrow_up,
    this.size = 40,
  });

  final ScrollController scrollController;
  final double showAtOffset;
  final IconData icon;
  final double size;

  @override
  State<BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  bool _show = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final pixels = widget.scrollController.positions.first.pixels;
    final shouldShow = pixels > widget.showAtOffset;
    if (shouldShow != _show) {
      setState(() => _show = shouldShow);
    }
  }

  void _scrollToTop() {
    feedBack();
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedOpacity(
      opacity: _show ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.size,
        height: widget.size,
        child: _show
            ? FloatingActionButton(
                mini: true,
                heroTag: null,
                elevation: 4,
                backgroundColor: theme.colorScheme.secondaryContainer,
                foregroundColor: theme.colorScheme.onSecondaryContainer,
                onPressed: _scrollToTop,
                child: Icon(widget.icon, size: widget.size * 0.5),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
