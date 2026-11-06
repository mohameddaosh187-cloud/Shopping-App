import 'package:shopping_app/features/account/domain/entities/user_data_entity.dart';

class UserDataDto {
  MessageDto? message;

  UserDataDto({this.message});

  UserDataDto.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null
        ? MessageDto.fromJson(json['message'])
        : null;
  }
  // toEntity
  UserDataEntity toEntity() {
    return UserDataEntity(message: message!.toEntity());
  }
}

class MessageDto {
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? image;

  MessageDto({
    this.sId,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.image,
  });

  MessageDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
  }
  // toEntity
  MessageEntity toEntity() {
    return MessageEntity(
      sId: sId ?? "",
      name: name ?? "",
      phone: phone ?? "",
      email: email ?? "",
      address: address ?? "",
      image: image ?? "",
    );
  }
}
