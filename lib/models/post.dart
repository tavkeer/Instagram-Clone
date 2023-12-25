class Post {
  String? id;
  String? posterId;
  String? posterUserName;
  String? caption;
  String? imgLink;
  String? likesCount;
  String? commentsCount;
  String? latestComment;
  String? postedAt;
  String? location;
  bool? public;

  Post({
    required this.id,
    required this.caption,
    required this.commentsCount,
    required this.imgLink,
    required this.latestComment,
    required this.likesCount,
    required this.postedAt,
    required this.posterUserName,
    required this.posterId,
  });
}
