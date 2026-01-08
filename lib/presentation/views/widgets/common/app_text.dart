import 'package:flutter/material.dart';
import 'package:web_site/core/app_styles.dart';

/// A custom text widget that wraps the standard [Text] widget.
/// It provides an optional [FittedBox] wrapper to ensure text scales well
/// across different screen sizes (mobile, tablet, desktop).
class AppText extends StatelessWidget {
  final String? data;
  final InlineSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  /// Whether to wrap the text in a [FittedBox].
  final bool useFittedBox;

  /// How to fit the text within the [FittedBox] if [useFittedBox] is true.
  final BoxFit fit;

  /// How to align the text within the [FittedBox] if [useFittedBox] is true.
  final AlignmentGeometry alignment;

  const AppText(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.useFittedBox = false,
    this.fit = BoxFit.scaleDown,
    this.alignment = Alignment.center,
  }) : textSpan = null;

  const AppText.rich(
    this.textSpan, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.useFittedBox = false,
    this.fit = BoxFit.scaleDown,
    this.alignment = Alignment.center,
  }) : data = null;

  @override
  Widget build(BuildContext context) {
    final Widget textWidget;
    final effectiveStyle = style ?? AppStyles.styleRegular16(context);

    if (textSpan != null) {
      textWidget = Text.rich(
        textSpan!,
        style: effectiveStyle,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
    } else {
      textWidget = Text(
        data ?? '',
        style: effectiveStyle,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
    }

    if (useFittedBox) {
      return FittedBox(
        fit: fit,
        alignment: alignment,
        child: textWidget,
      );
    }

    return textWidget;
  }
}
