import 'package:flutter/cupertino.dart';

import '../models/friends_model.dart';
import '../models/post_model.dart';

class CurrentState extends ChangeNotifier {
  List<FriendsModel> sampleFriends = [
    FriendsModel(
        name: "Deepak ",
        followers: 12,
        following: false,
        profilePic: "",
        userName: "highcoder_"),
    FriendsModel(
        name: "Manik ",
        followers: 1000,
        following: false,
        profilePic: "",
        userName: "manik"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
    FriendsModel(
        name: "Sara ",
        followers: 100,
        following: false,
        profilePic: "",
        userName: "higherrrt"),
  ];

  List<PostModel> posts = [
    PostModel(
        user: FriendsModel(
            name: "Deepak ",
            followers: 12,
            following: false,
            profilePic: "",
            userName: "highcoder_"),
        title:
            "This is the Threads clone which is already a clone of twitter/X",
        comments: 12,
        likes: 1,
        timePosted: DateTime.now()),
    PostModel(
        user: FriendsModel(
            name: "Deepak ",
            followers: 12,
            following: false,
            profilePic: "",
            userName: "highcoder_"),
        title:
            "Created this website with inspiration from Pawan Sir, later decided to create tutorial of how you can make this website, it is easier than it looks! Lets get started final Version",
        comments: 12,
        likes: 1,
        imageLink:
            "https://firebasestorage.googleapis.com/v0/b/portfoliowebsite-cf9c3.appspot.com/o/thumbnail.png?alt=media&token=369e1226-b448-412b-a2a1-4740e25560c0&_gl=1*wzvsmu*_ga*MjE2MjgyNzM5LjE2NzIzODM0NzM.*_ga_CW55HF8NVT*MTY5NzI3MTI2OS4yOTUuMS4xNjk3MjcxNjAxLjMzLjAuMA..",
        timePosted: DateTime.now()),
  ];

  followUserOrUnFollow(int local, bool following) async {
    sampleFriends[local].following = !following;
    notifyListeners();
  }
}
