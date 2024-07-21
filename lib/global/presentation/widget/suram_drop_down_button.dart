import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DropMenu extends Equatable {
  final String id;
  final String label;

  const DropMenu({
    required this.id,
    required this.label,
  });

  @override
  List<Object?> get props => [id, label];
}

class SuramDropDownButton<T> extends StatefulWidget {
  const SuramDropDownButton({
    super.key,
    required this.title,
    this.initialText = '',
    this.hintText = '',
    required this.onSelected,
    this.visible = true,
    required this.items,
  });

  final String title;
  final String initialText;
  final String hintText;
  final bool visible;
  final Function(DropMenu) onSelected;
  final List<DropMenu> items;

  @override
  State<SuramDropDownButton> createState() => _SuramDropDownButtonState<T>();
}

class _SuramDropDownButtonState<T> extends State<SuramDropDownButton> {
  TextEditingController menuController = TextEditingController();

  @override
  void initState() {
    if (widget.initialText.isNotEmpty) {
      menuController.text = widget.initialText;
    }
    super.initState();
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 4),
          DropdownMenu<DropMenu>(
            controller: menuController,
            onSelected: (DropMenu? menu) {
              if (menu != null) {
                widget.onSelected(menu);
              }
            },
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            width: MediaQuery.of(context).size.width - 32,
            hintText: widget.hintText,
            requestFocusOnTap: false,
            enableFilter: true,
            menuStyle: MenuStyle(
              //backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
            ),
            dropdownMenuEntries: widget.items
                .map(
                  (e) => DropdownMenuEntry<DropMenu>(
                    value: e,
                    label: e.label,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );

    // return Drop(
    //   child: DropdownButtonFormField(
    //     dropdownColor: Colors.white,
    //     alignment: Alignment.bottomCenter,
    //     isExpanded: true,
    //     decoration: InputDecoration(
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(16),
    //       ),
    //       labelText: 'Блок',
    //       labelStyle: TextStyle(
    //         color: Colors.black.withOpacity(0.60),
    //       ),
    //       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //     ),
    //     items: [
    //       DropdownMenuItem<int>(
    //         child: Container(
    //           width: 100,
    //           child: Text('2'),
    //         ),
    //         value: 1,
    //         onTap: () {},
    //       ),
    //       DropdownMenuItem<int>(
    //         child: Container(
    //           width: 100,
    //           child: Text('2'),
    //         ),
    //         value: 2,
    //         onTap: () {},
    //       ),
    //       DropdownMenuItem<int>(
    //         child: Container(
    //           width: 100,
    //           child: Text('2'),
    //         ),
    //         value: 3,
    //         onTap: () {},
    //       ),
    //     ],
    //     onChanged: (value) {},
    //   ),
    // );
  }
}
