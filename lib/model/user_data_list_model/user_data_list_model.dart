import 'package:mechine_test/extra/exports.dart';

part 'user_data_list_model.g.dart';

@JsonSerializable()
class UserDataListModel {
  @JsonKey(name: 'data')
  List<UserData>? data;

  UserDataListModel({this.data});

  UserDataListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(UserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'picture')
  String? picture;

  UserData({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    return data;
  }
}
