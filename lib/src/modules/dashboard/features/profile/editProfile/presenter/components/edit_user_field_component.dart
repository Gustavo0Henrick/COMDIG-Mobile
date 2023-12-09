import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfileFieldComponent extends StatelessWidget {
  final double width;
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final List<TextInputFormatter>? inpuFormatters;
  const EditProfileFieldComponent({
    Key? key,
    required this.width,
    required this.controller,
    required this.label,
    required this.type,
    this.inpuFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: SizerHelper.calculateVertical(context, 85),
      color: Theme.of(context).colorScheme.onTertiary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: SizedBox(
            height: SizerHelper.calculateVertical(context, 65),
            width: SizerHelper.calculateHorizontal(context, 320),
            child: TextFormField(
              controller: controller,
              keyboardType: type,
              inputFormatters: inpuFormatters,
              decoration: InputDecoration(filled: true, hintText: label),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return '';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}
