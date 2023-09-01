class ZoomitModel {
  ZoomitModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.lead,
    required this.subHeadline,
    required this.isFeatured,
    required this.isAdvertisement,
    required this.publishedDate,
    required this.readingTime,
    required this.author,
    required this.coverImageLink,
    required this.linkIsFollow,
    required this.type,
    required this.mainCategoryId,
    required this.totalDiscussCount,
    required this.likesCount,
  });
  late final String id;
  late final String title;
  late final String slug;
  late final String lead;
  late final String subHeadline;
  late final bool isFeatured;
  late final bool isAdvertisement;
  late final String publishedDate;
  late final int readingTime;
  late final Author author;
  late final CoverImageLink coverImageLink;
  late final bool linkIsFollow;
  late final String type;
  late final String mainCategoryId;
  late final int totalDiscussCount;
  late final int likesCount;

  ZoomitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    lead = json['lead'];
    subHeadline = json['subHeadline'];
    isFeatured = json['isFeatured'];
    isAdvertisement = json['isAdvertisement'];
    publishedDate = json['publishedDate'];
    readingTime = json['readingTime'];
    author = Author.fromJson(json['author']);
    coverImageLink = CoverImageLink.fromJson(json['coverImageLink']);
    linkIsFollow = json['linkIsFollow'];
    type = json['type'];
    mainCategoryId = json['mainCategoryId'];
    totalDiscussCount = json['totalDiscussCount'];
    likesCount = json['likesCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['lead'] = lead;
    data['subHeadline'] = subHeadline;
    data['isFeatured'] = isFeatured;
    data['isAdvertisement'] = isAdvertisement;
    data['publishedDate'] = publishedDate;
    data['readingTime'] = readingTime;
    data['author'] = author.toJson();
    data['coverImageLink'] = coverImageLink.toJson();
    data['linkIsFollow'] = linkIsFollow;
    data['type'] = type;
    data['mainCategoryId'] = mainCategoryId;
    data['totalDiscussCount'] = totalDiscussCount;
    data['likesCount'] = likesCount;
    return data;
  }
}

class Author {
  Author({
    required this.userId,
    required this.fullName,
    required this.avatarId,
    required this.articlesCount,
  });
  late final String userId;
  late final String fullName;
  late final String avatarId;
  late final int articlesCount;

  Author.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    avatarId = json['avatarId'];
    articlesCount = json['articlesCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['fullName'] = fullName;
    data['avatarId'] = avatarId;
    data['articlesCount'] = articlesCount;
    return data;
  }
}

class CoverImageLink {
  CoverImageLink({
    required this.id,
    required this.fileName,
    required this.alt,
    required this.preview,
    required this.width,
    required this.height,
  });
  late final String id;
  late final String fileName;
  late final String alt;
  late final String preview;
  late final int width;
  late final int height;

  CoverImageLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['fileName'];
    alt = json['alt'];
    preview = json['preview'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fileName'] = fileName;
    data['alt'] = alt;
    data['preview'] = preview;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
