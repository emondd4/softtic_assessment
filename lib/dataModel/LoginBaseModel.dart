class LoginBaseModel {
  LoginBaseModel({
      this.idToken,});

  LoginBaseModel.fromJson(dynamic json) {
    idToken = json['id_token'];
  }
  String? idToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_token'] = idToken;
    return map;
  }

}