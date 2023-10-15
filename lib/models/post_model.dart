import 'package:threads_clone/models/friends_model.dart';

class PostModel {
  FriendsModel user;
  String title;
  int likes;
  int comments;
  DateTime timePosted;
  bool userLiked;
  String ?imageLink;

  PostModel({
    required this.user,
    required this.title,
    required this.comments,
    required this.likes,
    required this.timePosted,
    this.userLiked = false,
    this.imageLink,
  });

}