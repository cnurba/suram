import 'package:flutter/material.dart';

class SuramEditingField extends StatefulWidget {
  const SuramEditingField({
    super.key,
    required this.title,
    this.hintText = '',
    required this.onChanged,
    this.initialText = '',
    this.readOnly = false,
    required this.onSelect,
    this.halfWidthField = false,
    this.keyboardType = TextInputType.text,
    this.isThreeLine = false,
    this.visible = true,
    this.updatedText = '',
  });

  final String title;
  final String initialText;
  final String hintText;
  final Function(String) onChanged;
  final bool readOnly;
  final Function() onSelect;
  final bool halfWidthField;
  final TextInputType keyboardType;
  final bool isThreeLine;
  final bool visible;
  final String updatedText;

  @override
  State<SuramEditingField> createState() => _SuramEditingFieldState();
}

class _SuramEditingFieldState extends State<SuramEditingField> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  bool readOnly = false;

  @override
  void initState() {
    if (widget.initialText.isNotEmpty) {
      _controller.text = widget.initialText;
    }
    if (widget.readOnly) {
      readOnly = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.updatedText.isNotEmpty) {
      _controller.text = widget.updatedText;
    }
    return Visibility(
      visible: widget.visible,
      child: SizedBox(
        width: widget.halfWidthField
            ? MediaQuery.sizeOf(context).width / 2.3
            : double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(widget.title, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 4),
            TextFormField(
              keyboardType: widget.keyboardType,
              maxLines: widget.isThreeLine ? 3 : 1,
              focusNode: _focusNode,
              readOnly: readOnly,
              controller: _controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: "Enter title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                suffixIcon: _SuffixPopupMenu(
                  onEdit: () {
                    readOnly = false;
                    setState(() {});
                    _focusNode.requestFocus();
                  },
                  onSelect: () {
                    _focusNode.unfocus();
                    widget.onSelect();
                  },
                  onClear: _controller.clear,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuffixPopupMenu extends StatelessWidget {
  const _SuffixPopupMenu(
      {super.key,
      required this.onEdit,
      required this.onSelect,
      required this.onClear});

  final void Function() onEdit;
  final void Function() onSelect;
  final void Function() onClear;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      clipBehavior: Clip.hardEdge,
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 150),
      ),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.more_vert),
      onSelected: (value) {
        switch (value) {
          case 0:
            onEdit();
            break;
          case 1:
            onSelect();
            break;
          case 2:
            onClear();
            break;
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(Icons.edit),
              SizedBox(width: 8),
              Text("Изменить"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.select_all),
              SizedBox(width: 8),
              Text("Выбрать"),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.clear, color: Colors.red),
              SizedBox(width: 8),
              Text("Очистить"),
            ],
          ),
        ),
      ],
    );
  }
}
