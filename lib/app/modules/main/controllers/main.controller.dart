
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainController extends GetxController {

  var ups = ["A","Ă","Â","B","C","D","Đ","E","Ê","G","H","I","K",
    "L","M","N","O","Ô","Ơ","P","Q","R","S","T","U","Ư","V","X","Y"];
  var los = ["a","ă","â","b","c","d","đ","e","ê","g","h","i","k",
  "l","m","n","o","ô","ơ","p","q","r","s","t","u","ư","v","x","y"];
  var diaos = '''À/à Ằ/ằ Ầ/ầ È/è Ề/ề Ì/ì Ò/ò Ồ/ồ Ờ/ờ Ù/ù Ừ/ừ Ỳ/ỳ Ả/ả Ẳ/ẳ Ẩ/ẩ Ẻ/ẻ Ể/ể Ỉ/ỉ Ỏ/ỏ Ổ/ổ Ở/ở Ủ/ủ Ử/ử Ỷ/ỷ 
      Ã/ã Ẵ/ẵ Ẫ/ẫ Ẽ/ẽ Ễ/ễ Ĩ/ĩ Õ/õ Ỗ/ỗ Ỡ/ỡ Ũ/ũ Ữ/ữ Ỹ/ỹ Á/á Ắ/ắ Ấ/ấ É/é Ế/ế Í/í Ó/ó Ố/ố Ớ/ớ Ú/ú Ứ/ứ Ý/ý Ạ/ạ Ặ/ặ Ậ/ậ 
      Ẹ/ẹ Ệ/ệ Ị/ị Ọ/ọ Ộ/ộ Ợ/ợ Ụ/ụ Ự/ự Ỵ/ỵ''';
  RxString resK = "".obs;
  Map dict = {};
  @override
  void onReady() async{
    super.onReady();
    var updiaos = diaos.split(" ");

    final List fixedList = Iterable<int>.generate(ups.length).toList();
    fixedList.forEach((idx) {
      dict[los[idx]] = ups[idx];
    });

    updiaos.forEach((element) {
      String up = element.split("/").first;
      String low = element.split("/").last;
      dict[low] = up;
    });
  }
  void treatStr(String oriStr){
    List cs = oriStr.split("");
    var res = cs.map((e){
      if(dict[e] != null){
        return dict[e];
      }
      return e;
    }).toList().join();
    print(res);
    resK.value = res;
  }

  TextEditingController editVc = TextEditingController();

}
