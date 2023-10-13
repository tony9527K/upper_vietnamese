import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/global.dart';

class WidgetInput extends StatelessWidget {
  const WidgetInput({ Key? key,
    this.controller,
    this.hintText = "",
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.fontSize,
    this.autofocus = false,
    this.focusNode,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final int maxLines;
  final double? fontSize;
  final bool autofocus;
  final FocusNode? focusNode;
  final int? maxLength;
  @override
  Widget build(BuildContext context){
    return TextField(
      scrollPadding:const EdgeInsets.all(0),
      keyboardType:keyboardType,
      // obscureText: obscureText,
      controller: controller,
      enableSuggestions:false,
      autocorrect:false,
      textAlign:textAlign,
      autofocus:autofocus,
      maxLines: maxLines,
      maxLength:maxLength,
      maxLengthEnforcement:MaxLengthEnforcement.truncateAfterCompositionEnds,
      buildCounter:(context, {required int currentLength, required bool isFocused, maxLength}) {
        return null;
      },
      focusNode: focusNode,
      decoration:  InputDecoration(
        ///高度包裹
        isCollapsed:true,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
            color: const Color(0xff818181),
            fontSize:fontSize ?? 16.rpx,
            height:1.4
        ),
      ),
      style:  TextStyle(
          color: Colors.black,
          fontSize:fontSize ?? 16.rpx),
    );
  }
}