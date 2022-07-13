import 'package:get/get.dart';
import 'package:intl/intl.dart';

String getStringMessageTime(DateTime? dateTime){
  if(dateTime == null) {
  return "longTimeAgo".tr;
  }
  DateTime nowTime = DateTime.now();
  final int statement=dateTime.difference(nowTime).inDays.abs();
  print(statement);
  if(statement == 0){
    return "today";
  }
  if(statement == 1){
    return "yesterday";
  }else{
    final formatter = DateFormat('dd MMMM');
    return formatter.format(dateTime);
  }

}