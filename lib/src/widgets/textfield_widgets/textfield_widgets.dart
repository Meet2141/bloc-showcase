import 'package:bloc_showcase/src/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// TextFieldWidgets is common textField used in app.
class TextFieldWidgets extends StatelessWidget {
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validate;
  final TextInputType keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final Color? focusColorBorder;
  final TextEditingController? controller;
  final bool isEnabled;
  final bool? showCursor;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final bool autoValidate;
  final TextStyle? errorStyle;
  final FocusNode? focusNode;
  final String? mandatoryText;
  final bool mandatory;
  final bool isScrollPadding;
  final bool alignHintLabel;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatter;
  final String? initialValue;
  final BorderRadius? borderRadius;
  final bool showLabel;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? disabledBorder;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedErrorBorder;
  final OutlineInputBorder? errorBorder;

  const TextFieldWidgets({
    super.key,
    this.color,
    this.alignHintLabel = true,
    this.fontSize,
    this.isScrollPadding = false,
    this.mandatory = false,
    this.autoFocus = false,
    this.mandatoryText,
    this.maxLines,
    this.suffix,
    this.onTap,
    this.onChange,
    this.validate,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.focusColorBorder,
    this.controller,
    this.isEnabled = true,
    this.labelText,
    this.prefix,
    this.hintText,
    this.inputFormatter,
    this.autoValidate = true,
    this.focusNode,
    this.errorStyle,
    this.initialValue,
    this.borderRadius,
    this.showLabel = true,
    this.suffixIcon,
    this.prefixIcon,
    this.showCursor,
    this.focusedBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      initialValue: initialValue,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      controller: controller,
      maxLines: maxLines ?? 1,
      onTap: onTap,
      cursorColor: ColorConstants.black,
      focusNode: focusNode,
      scrollPadding:
          isScrollPadding ? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 100) : EdgeInsets.zero,
      inputFormatters: inputFormatter,
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      validator: validate,
      maxLength: maxLength,
      keyboardType: keyboardType,
      enabled: isEnabled,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? (isEnabled ? ColorConstants.black : ColorConstants.grey600),
      ),
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        labelStyle: const TextStyle(fontSize: 12, color: ColorConstants.grey600),
        hintStyle: const TextStyle(fontSize: 12, color: ColorConstants.grey600),
        label: (showLabel)
            ? RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: isEnabled ? ColorConstants.black : ColorConstants.grey600,
                  ),
                  text: labelText ?? hintText,
                  children: [
                    TextSpan(
                        text: mandatoryText,
                        style: TextStyle(
                            color: mandatory == true
                                ? ColorConstants.red
                                : isEnabled
                                    ? ColorConstants.black
                                    : ColorConstants.grey600,
                            fontSize: mandatory == true ? 16 : 14))
                  ],
                ),
              )
            : null,
        alignLabelWithHint: alignHintLabel,
        filled: true,
        isDense: true,
        fillColor: ColorConstants.white,
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffix: suffix,
        suffixIcon: suffixIcon,
        errorStyle: errorStyle ?? const TextStyle(color: ColorConstants.red, height: 0.5),
        contentPadding: EdgeInsets.only(left: 14.0, bottom: maxLength == null ? 12.0 : 26.0, top: 12.0, right: 15),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: focusColorBorder ?? ColorConstants.black, width: 1),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
        disabledBorder: disabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstants.grey600, width: 1),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstants.grey600, width: 1),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstants.red, width: 1.5),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: ColorConstants.red, width: 1),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
      ),
    );
  }
}
