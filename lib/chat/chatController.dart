import 'package:ahmad/model/messageModel.dart';
import 'package:ahmad/utils/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
  ScrollController scrollController = ScrollController();
  late List<MessageModel> items = getMessages();
 }