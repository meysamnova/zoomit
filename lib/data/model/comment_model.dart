class CommentModel {
  CommentModel({
    required this.allFeedback,
    required this.hasNext,
  });
  late final List<AllFeedback> allFeedback;
  late final bool hasNext;

  CommentModel.fromJson(Map<String, dynamic> json) {
    allFeedback = List.from(json['allFeedback'])
        .map((e) => AllFeedback.fromJson(e))
        .toList();
    hasNext = json['hasNext'];
  }

}

class AllFeedback {
  AllFeedback({
    required this.commentChildren,
    required this.id,
    required this.type,
    required this.userId,
    required this.topicId,
    required this.topicTitle,
    required this.topicSlug,
    required this.topicType,
    required this.tenant,
    required this.mentions,
    required this.content,
    required this.childrenCount,
    required this.likesCount,
    required this.status,
    required this.trashReasons,
    required this.isLikedByCurrentUser,
    required this.user,
    required this.createdAt,
  });
  late final List<CommentChildren> commentChildren;
  late final String id;
  late final String type;
  late final String userId;
  late final String topicId;
  late final String topicTitle;
  late final String topicSlug;
  late final String topicType;
  late final String tenant;
  late final List<dynamic> mentions;
  late final String content;
  late final int childrenCount;
  late final int likesCount;
  late final List<String> status;
  late final List<dynamic> trashReasons;
  late final bool isLikedByCurrentUser;
  late final User user;
  late final String createdAt;

  AllFeedback.fromJson(Map<String, dynamic> json) {
    commentChildren = List.from(json['commentChildren'])
        .map((e) => CommentChildren.fromJson(e))
        .toList();
    id = json['id'];
    type = json['type'];
    userId = json['userId'];
    topicId = json['topicId'];
    topicTitle = json['topicTitle'];
    topicSlug = json['topicSlug'];
    topicType = json['topicType'];
    tenant = json['tenant'];
    mentions = List.castFrom<dynamic, dynamic>(json['mentions']);
    content = json['content'];
    childrenCount = json['childrenCount'];
    likesCount = json['likesCount'];
    status = List.castFrom<dynamic, String>(json['status']);
    trashReasons = List.castFrom<dynamic, dynamic>(json['trashReasons']);
    isLikedByCurrentUser = json['isLikedByCurrentUser'];
    user = User.fromJson(json['user']);
    createdAt = json['createdAt'];
  }


}

class CommentChildren {
  CommentChildren({
    required this.parentId,
    required this.parentRootId,
    required this.id,
    required this.type,
    required this.userId,
    required this.topicId,
    required this.topicTitle,
    required this.topicSlug,
    required this.topicType,
    required this.tenant,
    required this.ranges,
    required this.mentions,
    required this.content,
    required this.childrenCount,
    required this.likesCount,
    required this.status,
    required this.trashReasons,
    required this.isLikedByCurrentUser,
    required this.user,
    required this.createdAt,
  });
  late final String parentId;
  late final String parentRootId;
  late final String id;
  late final String type;
  late final String userId;
  late final String topicId;
  late final String topicTitle;
  late final String topicSlug;
  late final String topicType;
  late final String tenant;
  late final List<dynamic> ranges;
  late final List<dynamic> mentions;
  late final String content;
  late final int childrenCount;
  late final int likesCount;
  late final List<String> status;
  late final List<dynamic> trashReasons;
  late final bool isLikedByCurrentUser;
  late final User user;
  late final String createdAt;

  CommentChildren.fromJson(Map<String, dynamic> json) {
    parentId = json['parentId'];
    parentRootId = json['parentRootId'];
    id = json['id'];
    type = json['type'];
    userId = json['userId'];
    topicId = json['topicId'];
    topicTitle = json['topicTitle'];
    topicSlug = json['topicSlug'];
    topicType = json['topicType'];
    tenant = json['tenant'];
    ranges = List.castFrom<dynamic, dynamic>(json['ranges']);
    mentions = List.castFrom<dynamic, dynamic>(json['mentions']);
    content = json['content'];
    childrenCount = json['childrenCount'];
    likesCount = json['likesCount'];
    status = List.castFrom<dynamic, String>(json['status']);
    trashReasons = List.castFrom<dynamic, dynamic>(json['trashReasons']);
    isLikedByCurrentUser = json['isLikedByCurrentUser'];
    user = User.fromJson(json['user']);
    createdAt = json['createdAt'];
  }


}

class User {
  User({
    required this.userId,
    required this.fullName,
    required this.userName,
    required this.displayFullName,
    required this.avatarId,
  });
  late final String userId;
  late final String fullName;
  late final String userName;
  late final bool displayFullName;
  late final String avatarId;

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    userName = json['userName'];
    displayFullName = json['displayFullName'];
    avatarId = json['avatarId'];
  }

}
