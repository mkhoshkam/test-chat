import 'package:ahmad/model/dialogModel.dart';
import 'package:ahmad/utils/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogController extends GetxController{
  ScrollController scrollController = ScrollController();
  RxString searchText = ''.obs;
  late List<DialogModel> items = getDialogs();
  late List<DialogModel> filters = [];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
    // searchController.dispose();
  }

  void setFilter(String text){
    searchText.value = text;
    print(text);
    if(text.isEmpty){
      filters = items;
    }else{
      filters = items.where((element) => element.name.toString().toLowerCase().contains(text.toLowerCase())).toList();
    }
  }

 }