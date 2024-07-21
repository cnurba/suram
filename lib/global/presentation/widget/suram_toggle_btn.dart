import 'package:flutter/material.dart';

class SuramToggleBtn extends StatefulWidget {
  final List<Text> texts;
  final Function(int) selected;
  final Color selectedColor;
  final bool multipleSelectionsAllowed;
  final bool stateContained;
  final bool canUnToggle;

  const SuramToggleBtn({
    super.key,
    required this.texts,
    required this.selected,
    this.selectedColor = const Color(0xFF6200EE),
    this.stateContained = true,
    this.canUnToggle = false,
    this.multipleSelectionsAllowed = true,
  });

  @override
  _SuramToggleBtnState createState() => _SuramToggleBtnState();
}

class _SuramToggleBtnState extends State<SuramToggleBtn> {
  late List<bool> isSelected = [];

  @override
  void initState() {
    for (var e in widget.texts) {
      if (widget.texts.indexOf(e) == 0) {
        isSelected.add(true);
      } else {
        isSelected.add(false);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButtons(
            color: Colors.black.withOpacity(0.60),
            selectedColor: widget.selectedColor,
            selectedBorderColor: widget.selectedColor,
            fillColor: widget.selectedColor.withOpacity(0.08),
            splashColor: widget.selectedColor.withOpacity(0.12),
            hoverColor: widget.selectedColor.withOpacity(0.04),
            borderRadius: BorderRadius.circular(16),
            isSelected: isSelected,
            highlightColor: Colors.transparent,
            onPressed: (index) {
              // send callback
              widget.selected(index);
              // if you wish to have state:
              if (widget.stateContained) {
                if (!widget.multipleSelectionsAllowed) {
                  final selectedIndex = isSelected[index];
                  isSelected = isSelected.map((e) => e = false).toList();
                  if (widget.canUnToggle) {
                    isSelected[index] = selectedIndex;
                  }
                }
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              }
            },
            children: widget.texts
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
