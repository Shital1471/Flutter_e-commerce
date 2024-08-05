import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  final String text;
  final bool selected;
  final bool isColors;
  
  final void Function(bool)? onSelected;
  TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected,required this.isColors});

  @override
  Widget build(BuildContext context) {
  
    return ChoiceChip(
      label: isColors ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      avatar: isColors
          ? Container(
              width: 50,
              height: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.greenAccent),
            )
          : null,
      labelPadding: isColors ? const EdgeInsets.all(0) : null,
      padding: isColors ? const EdgeInsets.all(0) : null,
      shape: isColors ? CircleBorder() : null,
      backgroundColor:  Colors.green ,
    );
  }
}
