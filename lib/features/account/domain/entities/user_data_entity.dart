import 'package:shopping_app/core/constants/constants_value.dart';

class UserDataEntity {
  MessageEntity message;

  UserDataEntity({this.message = const MessageEntity()});
}

class MessageEntity {
  final String sId;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String image;

  const MessageEntity({
    this.sId = "sId",
    this.name = "name",
    this.phone = "phone",
    this.email = "email",
    this.address = "address",
    this.image = ConstantsValue.image,
  });
}
