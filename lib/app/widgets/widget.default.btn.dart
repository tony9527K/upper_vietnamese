import 'package:flutter/material.dart';
import '../common/global.dart';

class WidgetDefaultBtn extends GestureDetector {
  final double? width;
  final double? height;
  final double? fontSize;
  final bool disabled;
  final Widget? text;
  final bool border;
  WidgetDefaultBtn(String txt,{super.key,super.onTap,this.text,this.width,this.height,this.fontSize,this.disabled = false,this.border = false}) : super(
    child: Container(
        width:width ?? 285.rpx,
        height:height ?? 45.rpx,
        alignment:Alignment.center,
        decoration:BoxDecoration(
            color:disabled ? const Color(0xffe9e9e9): const Color(0xffe6abff),
            borderRadius: BorderRadius.all(
                Radius.circular(height ?? 45.rpx)
            ),
            border:!border ? null : Border.all(color:Colors.black,width:1.rpx)
        ),
        child:text ?? Text(txt,style: TextStyle(color:Colors.black,fontSize:fontSize ?? 17.rpx,fontWeight:FontWeight.w600),)),
  );
}

