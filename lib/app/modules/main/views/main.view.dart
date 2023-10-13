import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:upper_vn/app/common/global.dart';
import '../../../widgets/widget.input.dart';
import '../../../widgets/widget.default.btn.dart';

import '../controllers/main.controller.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find<MainController>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child:KeyboardDismisser(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('小写转大写'),
              centerTitle: true,
            ),
            body:SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:EdgeInsets.all(20.rpx),
                    child:Container(
                        width:Global.width,
                        height:100.rpx,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10.rpx),
                          color: Colors.grey,
                        ),
                        child:Padding(
                          padding:EdgeInsets.all(20.rpx),
                          child:WidgetInput(
                            controller:controller.editVc,
                            autofocus: true,
                            fontSize:16.rpx,
                            maxLines:10000,
                          ),
                        )
                    ),
                  ),
                  WidgetDefaultBtn(
                    "转换",
                    width: 100.rpx,
                    height: 30.rpx,
                    onTap: (){
                      controller.treatStr(controller.editVc.text);
                    },
                  ),
                  Padding(
                    padding:EdgeInsets.all(20.rpx),
                    child:Obx((){
                      return Container(
                        width:Global.width,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10.rpx),
                          color: Colors.greenAccent,
                        ),
                        child:Padding(
                          padding:EdgeInsets.all(20.rpx),
                          child:Text(
                            controller.resK.value,
                            style:TextStyle(
                                color:Colors.red,
                                fontSize: 16.5.rpx
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
