import 'dart:convert';
/// id : 1
/// userId : 1
/// message : ""
/// date : 12365548865

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));
String messageModelToJson(MessageModel data) => json.encode(data.toJson());
class MessageModel {
  MessageModel({
      int? id, 
      int? userId, 
      String? message, 
      DateTime? date,}){
    _id = id;
    _userId = userId;
    _message = message;
    _date = date;
}

  MessageModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _message = json['message'];
    _date = json['date'];
  }
  int? _id;
  int? _userId;
  String? _message;
  DateTime? _date;
MessageModel copyWith({  int? id,
  int? userId,
  String? message,
  DateTime? date,
}) => MessageModel(  id: id ?? _id,
  userId: userId ?? _userId,
  message: message ?? _message,
  date: date ?? _date,
);
  int? get id => _id;
  int? get userId => _userId;
  String? get message => _message;
  DateTime? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['message'] = _message;
    map['date'] = _date;
    return map;
  }

}