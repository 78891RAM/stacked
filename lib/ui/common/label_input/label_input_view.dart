import 'package:flutter/material.dart';

class LabelInputView extends StatelessWidget {
  final String? label;
  final String? hintText;
  final Function(String) onChangeFunc;
  final String? isEmptyErr;
  final bool isRequired;

  const LabelInputView(
      {this.label,
      this.hintText,
      required this.onChangeFunc,
      this.isEmptyErr,
      this.isRequired = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label!,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 5),
            if (isRequired) const Text('*', style: TextStyle(color: Colors.red))
          ],
        ),
        const SizedBox(height: 10),
        TextField(
          style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 1,
              fontWeight: FontWeight.w300),
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              hintText: hintText!,
              hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w300),
              filled: true,
              fillColor: const Color(0xFF494670)),
          onChanged: (value) => onChangeFunc(value),
        ),
        SizedBox(
          height: 20,
          child: isEmptyErr != null
              ? Text(isEmptyErr!, style: const TextStyle(color: Colors.red))
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
