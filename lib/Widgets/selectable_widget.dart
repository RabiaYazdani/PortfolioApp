import 'package:flutter/material.dart';

class SelectableImage extends StatelessWidget {
  const SelectableImage({
    Key? key,
    required this.isSelected,
    required this.imageAsset,
    required this.onTap,
  }) : super(key: key);
  final bool isSelected;
  final String imageAsset;
  final void Function(String imageAsset) onTap;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(imageAsset),
        child: Container(
          height: mediaQuery.height * 0.25,
          width: mediaQuery.height * 0.3,
          padding: isSelected ? const EdgeInsets.all(3) : null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isSelected ? Colors.orange : Colors.transparent,
                  width: 2)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageAsset, fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
