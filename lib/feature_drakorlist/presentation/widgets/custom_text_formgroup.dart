import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;
import 'package:mydrakorlist/core/config/theme/typography.dart' as appTypo;

class CustomTextFormGroup extends StatelessWidget {
  TextEditingController fieldController;
  String label;
  String hint;
  String errorMsg;
  bool isMultiline;

  CustomTextFormGroup({
    Key? key,
    required this.fieldController,
    required this.label,
    required this.hint,
    required this.errorMsg,
    required this.isMultiline
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            label,
            style: appTypo.bodySubtitle
        ),
        TextFormField(
          controller: fieldController,
          style: appTypo.body,
          keyboardType: isMultiline ? TextInputType.multiline : TextInputType.text,
          maxLength: isMultiline ? 500 : null,
          maxLines: null,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: appTypo.body.copyWith(color: appColor.defaultGray)
          ),
          cursorColor: appColor.defaultPrimary,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMsg;
            }
            return null;
          },
        ),
      ],
    );
  }
}
