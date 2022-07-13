import 'package:ahmad/dialog/dialogController.dart';
import 'package:ahmad/model/dialogModel.dart';
import 'package:ahmad/utils/time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/theme.dart';

class DialogView extends GetView<DialogController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar(),
        searchBox(context, controller),
        const Divider(height: 8.0, color: Colors.transparent),
        dialogs(context, controller),
        const Divider(height: 8.0, color: Colors.transparent),
      ],
    );
  }
}

Widget dialogs(BuildContext context, DialogController dialogController) {
  return Expanded(
      child: Obx(
    () => dialogController.searchText.isEmpty
        ? ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            shrinkWrap: false,
            controller: dialogController.scrollController,
            itemBuilder: (context, index) {
              return dialogItem(dialogController.items[index]);
            },
            itemCount: dialogController.items.length,
          )
        : ListView.builder(
            shrinkWrap: false,
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            controller: dialogController.scrollController,
            itemBuilder: (context, index) {
              return dialogItem(dialogController.filters[index]);
            },
            itemCount: dialogController.filters.length,
          ),
  ));
}

Widget topBar() {
  return SizedBox(
      height: 56.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("conversation".tr,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold)),
              Container(
                  height: 30.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 8.0),
                  decoration: const BoxDecoration(
                      color: red30,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const IconTheme(
                      data: IconThemeData(color: Colors.red),
                      child: Icon(Icons.add),
                    ),
                    Text(
                      "addNew".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    )
                  ]))
            ]),
      ));
}

Widget searchBox(BuildContext context, DialogController controller) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.maxFinite,
        height: 46,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
          decoration: BoxDecoration(
              color: searchBarColor, borderRadius: BorderRadius.circular(50.0)),
          child: TextFormField(
            onChanged: (text) {
              controller.setFilter(text);
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
                iconColor: Colors.black,
                alignLabelWithHint: true,
                border: InputBorder.none,
                hintText: "${"search".tr}...",
                prefixIcon: const IconTheme(
                  data: IconThemeData(color: Colors.grey),
                  child: Icon(Icons.search),
                )),
          ),
        ),
      ));
}

Widget dialogItem(DialogModel dialogModel) {
  return GestureDetector(
    onTap: () => {
      Get.toNamed("/chat", arguments: [dialogModel])
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(24), // Image radius
              child: Image.network(dialogModel.image.toString(),
                  fit: BoxFit.cover),
            ),
          ),
          const VerticalDivider(width: 8.0, color: Colors.transparent),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dialogModel.name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
              const Divider(height: 4.0, color: Colors.transparent),
              Text(dialogModel.message.toString(),
                  style: const TextStyle(fontSize: 11.0))
            ],
          )),
          Text(
            getStringMessageTime(dialogModel.date),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          )
        ],
      ),
    ),
  );
}
