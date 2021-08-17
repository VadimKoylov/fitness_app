class NewsData {
  String? caption;
  String? firstName;
  String? lastName;

  NewsData({this.caption, this.firstName, this.lastName});

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
      caption: json["caption"] ?? "",
      firstName: json["user"]['firstName'],
      lastName: json["user"]['lastName']);

  Map<String, dynamic> toJson() =>
      {"caption": caption, "firstName": firstName, "lastName": lastName};
}
