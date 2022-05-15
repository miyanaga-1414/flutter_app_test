import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AccountInfo {
  String? email;
  String? password;

  AccountInfo({
    this.email,
    this.password,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);
}

AccountInfo _$FormDataFromJson(Map<String, dynamic> json) {
  return AccountInfo(
    email: json['email'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
