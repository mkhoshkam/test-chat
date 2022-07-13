import 'package:ahmad/model/dialogModel.dart';
import 'package:ahmad/model/messageModel.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



List<DialogModel> getDialogs(){
  List<DialogModel> list = <DialogModel>[];
  for(int i=0;i<13;i++){
    final faker = Faker.instance;
    DialogModel model =DialogModel(
        name:faker.name.firstName(),
        image:faker.image.loremPicsum.image(),
        message: faker.lorem.sentence(wordCount: 4),
        date: i==0 ? DateTime.now() : DateTime.now().add(Duration(days: -i))
    );
    list.add(model);
  }
  return list;
}

List<MessageModel> getMessages(){
  List<MessageModel> list = <MessageModel>[];
  final faker = Faker.instance;
  for(int i=0;i<13;i++){
    MessageModel model =MessageModel(
        id:1,
        userId: 1,
        message: faker.lorem.sentence(wordCount: i+1*10),
        date: i==0 ? DateTime.now() : DateTime.now().add(Duration(days: -i))
    );
    list.add(model);
  }
  return list;
}