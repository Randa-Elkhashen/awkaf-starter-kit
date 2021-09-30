class Topic{
  int id;
  String title;
  String imageUrl;
  String thumbnailUrl;

  Topic({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.thumbnailUrl,
  });

  factory Topic.fromJson(Map<String,dynamic> parsedJson){
    return Topic(
      id: parsedJson["id"],
      title: parsedJson["title"],
      imageUrl: parsedJson["url"],
      thumbnailUrl: parsedJson["thumbnailUrl"],
    );
  }
}