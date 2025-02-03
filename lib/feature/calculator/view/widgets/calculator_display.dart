import 'package:flutter/material.dart';

class CalculatorDisplay extends StatefulWidget {
  final String equation;
  final String result;

  const CalculatorDisplay({
    super.key,
    required this.equation,
    required this.result,
  });

  @override
  State<CalculatorDisplay> createState() => _CalculatorDisplayState();
}

class _CalculatorDisplayState extends State<CalculatorDisplay> {
  late TextEditingController _equationController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _equationController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _equationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CalculatorDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update text and scroll to end when equation changes
    if (oldWidget.equation != widget.equation) {
      _equationController.text = widget.equation;
      _scrollToEnd();
    }
  }

  // Scroll to the end of text after layout is complete
  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Equation TextField
          TextField(
            controller: _equationController,
            scrollController: _scrollController,
            readOnly: true,
            maxLines: 2,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              color: isDarkMode ? Colors.grey[300] : Colors.grey[800],
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
              filled: true,
              fillColor: isDarkMode ? const Color(0xFF2C2C2C) : Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Divider(
            color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
          ),

          const SizedBox(height: 8),

          // Result display
          SizedBox(
            height: 48,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                widget.result,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
