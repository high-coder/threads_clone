class FriendsModel {
  String name;
  String userName;
  bool following;
  int followers;
  String profilePic;

  FriendsModel({
    required this.name,
    required this.followers,
    required this.following,
    required this.profilePic,
    required this.userName,
  });

  FriendsModel fromJson(Map<String, dynamic> json) {
    return FriendsModel(
        name: json['name'],
        followers: json["followers"],
        following: json["following"] ?? false,
        profilePic: json["profilePic"],
        userName: json["userName"]);
  }

  Map<String,dynamic> toJson() {
    return {
      'name':name,
      'followers':followers,
      'following':following,
      'profilePic':profilePic,
      'userName':userName,
    };
  }
}
