class ZoomitModel {
  ZoomitModel({
    // required this.id,
    required this.title,
    required this.slug,
    required this.lead,
    // required this.subHeadline,
    // required this.isFeatured,
    required this.isAdvertisement,
    required this.publishedDate,
    required this.readingTime,
    required this.author,
    required this.coverImageLink,
    // required this.linkIsFollow,
    // required this.type,
    // required this.mainCategoryId,
    required this.totalDiscussCount,
    required this.likesCount,
  }) {
    publishedDate = publishedDate ?? '';
    isAdvertisement = isAdvertisement ?? false;
    slug = slug ?? '';
    title = title ?? '';
    lead = lead ?? '';
    readingTime = readingTime ?? 0;
    totalDiscussCount = totalDiscussCount ?? 0;
    likesCount = likesCount ?? 0;
  }
  // late final String id;
  late final String? title;
  late final String? slug;
  late final String? lead;
  // late final String subHeadline;
  // late final bool isFeatured;
  late final bool? isAdvertisement;
  late final String? publishedDate;
  late final int? readingTime;
  late final Author author;
  late final CoverImageLink coverImageLink;
  // late final bool linkIsFollow;
  // late final String type;
  // late final String mainCategoryId;
  late final int? totalDiscussCount;
  late final int? likesCount;

  ZoomitModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    title = json['title'];
    slug = json['slug'];
    lead = json['lead'];
    // subHeadline = json['subHeadline'];
    // isFeatured = json['isFeatured'];
    isAdvertisement = json['isAdvertisement'];
    publishedDate = json['publishedDate'];
    readingTime = json['readingTime'];
    author = Author.fromJson(json['author']);
    coverImageLink = CoverImageLink.fromJson(json['coverImageLink']);
    // linkIsFollow = json['linkIsFollow'];
    // type = json['type'];
    // mainCategoryId = json['mainCategoryId'];
    totalDiscussCount = json['totalDiscussCount'];
    likesCount = json['likesCount'];
  }
}

class Author {
  Author({
    // required this.userId,
    required this.fullName,
    // required this.avatarId,
    // required this.articlesCount,
  }) {
    fullName = fullName ?? '';
  }
  // late final String userId;
  late final String? fullName;
  // late final String avatarId;
  // late final int articlesCount;

  Author.fromJson(Map<String, dynamic> json) {
    // userId = json['userId'];
    fullName = json['fullName'];
    // avatarId = json['avatarId'];
    // articlesCount = json['articlesCount'];
  }
}

class CoverImageLink {
  CoverImageLink({
    required this.id,
    // required this.fileName,
    // required this.alt,
    // required this.preview,
    // required this.width,
    // required this.height,
  });
  late final String id;
  // late final String fileName;
  // late final String alt;
  // late final String preview;
  // late final int width;
  // late final int height;

  CoverImageLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // fileName = json['fileName'];
    // alt = json['alt'];
    // preview = json['preview'];
    // width = json['width'];
    // height = json['height'];
  }
}
