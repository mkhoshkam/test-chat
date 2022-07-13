import 'package:ahmad/chat/chatController.dart';
import 'package:ahmad/model/dialogModel.dart';
import 'package:ahmad/model/messageModel.dart';
import 'package:ahmad/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        actions: actions(context),
        title: userInfo(Get.arguments[0]),
      ),
      body: Column(
        children: [
          chats(context, controller),
          inputLayout()
        ],
      ),
    );
  }
}

chats(BuildContext context, ChatController chatController) {
  return Expanded(
      child: ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    shrinkWrap: false,
    controller: chatController.scrollController,
    itemBuilder: (context, index) {
     return index%2==0 ?
       myMessageItem(context,chatController.items[index])
          :
       otherMessageItem(context, chatController.items[index],Get.arguments[0]);
    },
    itemCount: chatController.items.length,
  ));
}

inputLayout() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
    child: Row(
      children: [
        Expanded(
          child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Container(
                height: 52.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.emoji_emotions_sharp),
                      onPressed: () {},
                    ),
                    Expanded(child:
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          iconColor: Colors.black,
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          hintText: "${"type".tr}...",
                      ),
                    )
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {},
                    ),
                    IconButton(
                      color: Colors.black,
                      icon: const Icon(Icons.attach_file),
                      onPressed: () {},
                    ),
                  ],
                ),
              )),
        ),
        const VerticalDivider(width: 8.0, color: Colors.transparent),
        FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.mic,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

List<Widget> actions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.call),
      tooltip: 'Show Snackbar',
      onPressed: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('This is a snackbar')));
      },
    ),
    IconButton(
      icon: const Icon(Icons.videocam_rounded),
      tooltip: 'Show Snackbar',
      onPressed: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('This is a snackbar')));
      },
    ),
    IconButton(
      icon: const Icon(Icons.more_vert),
      tooltip: 'Show Snackbar',
      onPressed: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('This is a snackbar')));
      },
    ),
  ];
}

Widget userInfo(DialogModel dialogModel,) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Row(
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(18), // Image radius
            child:
                Image.network(dialogModel.image.toString(), fit: BoxFit.cover),
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
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: Colors.black87),
            ),
            const Divider(height: 4.0, color: Colors.transparent),
            const Text("Online",
                style: TextStyle(fontSize: 13.0, color: Colors.green))
          ],
        )),
      ],
    ),
  );
}

Widget myMessageItem(BuildContext context,MessageModel messageModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16.0),
    child: Row(
      // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
      // Spacer(),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
        child: Text("16:00 AM",style: TextStyle(color: Colors.grey),),
      ),
       Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(0.0),
          ),
        ),
        child:
        ConstrainedBox(
          constraints: BoxConstraints(
           maxWidth: (MediaQuery.of(context).size.width * 60/100) ,
            minWidth: double.minPositive
          ),
            child:Text(
              messageModel.message.toString(),
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.white),
            ),
            )
          )
    ]),
  );
}

Widget otherMessageItem(BuildContext context,MessageModel messageModel, DialogModel dialogModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16.0),
    child: Row(
      // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(18), // Image radius
              child:
              Image.network(dialogModel.image.toString(), fit: BoxFit.cover),
            ),
          ),
          const VerticalDivider(width: 4.0,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const Text(
              "client",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
                decoration: const BoxDecoration(
                  color: searchBarColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(0.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child:
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: (MediaQuery.of(context).size.width * 50/100) ,
                      minWidth: double.minPositive
                  ),
                  child:Text(
                    messageModel.message.toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.black87),
                  ),
                )
            ),
          ]),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
            child: Text("16:00 AM",style: TextStyle(color: Colors.grey),),
          ),
        ]),
  );
}