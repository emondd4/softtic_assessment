class ProfileBaseResponse {
  ProfileBaseResponse({
      this.id, 
      this.login, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.imageUrl, 
      this.activated, 
      this.langKey, 
      this.createdBy, 
      this.createdDate, 
      this.lastModifiedBy, 
      this.lastModifiedDate, 
      this.authorities,});

  ProfileBaseResponse.fromJson(dynamic json) {
    id = json['id'];
    login = json['login'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
    activated = json['activated'];
    langKey = json['langKey'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedDate = json['lastModifiedDate'];
    authorities = json['authorities'] != null ? json['authorities'].cast<String>() : [];
  }
  int? id;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? imageUrl;
  bool? activated;
  String? langKey;
  String? createdBy;
  dynamic createdDate;
  String? lastModifiedBy;
  String? lastModifiedDate;
  List<String>? authorities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['login'] = login;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['imageUrl'] = imageUrl;
    map['activated'] = activated;
    map['langKey'] = langKey;
    map['createdBy'] = createdBy;
    map['createdDate'] = createdDate;
    map['lastModifiedBy'] = lastModifiedBy;
    map['lastModifiedDate'] = lastModifiedDate;
    map['authorities'] = authorities;
    return map;
  }

}