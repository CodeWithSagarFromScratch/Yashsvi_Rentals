
import 'dart:convert';

GetProfileDetailmodel  getProfileDetailmodelFromJson(String str) =>
    GetProfileDetailmodel.fromJson(json.decode(str));

String getProfileDetailmodelToJson(GetProfileDetailmodel data) =>
    json.encode(data.toJson());

class GetProfileDetailmodel {
  String? statusCode;
  String? message;
  List<ProfiledetailList>? profileList;

  GetProfileDetailmodel({this.statusCode, this.message, this.profileList});

  factory GetProfileDetailmodel.fromJson(Map<String, dynamic> json) =>
      GetProfileDetailmodel(
          statusCode :json['status_code'],
          message : json['message'],
          profileList: List<ProfiledetailList>.from(
              json["profile_list"].map((x) => ProfiledetailList.fromJson(x)))
      );


  Map<String, dynamic> toJson() => {

    'status_code' :statusCode,
    'message' : message,
    'profile_list' :profileList!= null ? List<dynamic>.from(profileList!.map((x) => x.toJson()))
        : null,
  };
}

class ProfiledetailList {
  final String id;
  final String name;
  final String emailAddress;
  final String address;
  final String profileImage;
  final String flatDetails;
  final String landmark;
  final String direction;

  ProfiledetailList({
    required this.id,
    required this.name,
    required this.emailAddress,
    required this.address,
    required this.profileImage,
    required this.flatDetails,
    required this.landmark,
    required this.direction,
  });

  factory ProfiledetailList.fromJson(Map<String, dynamic> json) {
    return ProfiledetailList(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      emailAddress: json['email_address'] ?? '',
      address: json['address'] ?? '',
      profileImage: json['profile_image'] ?? '',
      flatDetails: json['flat_details'] ?? '',
      landmark: json['landmark'] ?? '',
      direction: json['direction'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "emailAddress": emailAddress,
    "address": address,
    "profileImage": profileImage,
    "flatDetails": flatDetails,
    "landmark": landmark,
    "direction": direction,
  };
}
