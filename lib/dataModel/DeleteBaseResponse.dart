class DeleteBaseResponse {
  DeleteBaseResponse({
      this.success,});

  DeleteBaseResponse.fromJson(dynamic json) {
    success = json['success'];
  }
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    return map;
  }

}