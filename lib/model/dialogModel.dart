import 'dart:convert';
/// name : ""
/// image : ""
/// message : ""
/// date : 8632598452

DialogModel dialogModelFromJson(String str) => DialogModel.fromJson(json.decode(str));
String dialogModelToJson(DialogModel data) => json.encode(data.toJson());
class DialogModel {
  DialogModel({
      String? name, 
      String? image, 
      String? message, 
      DateTime? date,}){
    _name = name;
    _image = image;
    _message = message;
    _date = date;
}

  DialogModel.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
    _message = json['message'];
    _date = json['date'];
  }
  String? _name;
  String? _image;
  String? _message;
  DateTime? _date;
DialogModel copyWith({  String? name,
  String? image,
  String? message,
  DateTime? date,
}) => DialogModel(  name: name ?? _name,
  image: image ?? _image,
  message: message ?? _message,
  date: date ?? _date,
);
  String? get name => _name;
  String? get image => _image;
  String? get message => _message;
  DateTime? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    map['message'] = _message;
    map['date'] = _date;
    return map;
  }

  setName(String? value) {
    _name = value;
  }

  setImage(String? value) {
    _image = value;
  }

  setMessage(String? value) {
    _message = value;
  }

  setDate(DateTime? value) {
    _date = value;
  }
}