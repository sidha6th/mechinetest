// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataListModel _$UserDataListModelFromJson(Map<String, dynamic> json) =>
    UserDataListModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataListModelToJson(UserDataListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
    };
