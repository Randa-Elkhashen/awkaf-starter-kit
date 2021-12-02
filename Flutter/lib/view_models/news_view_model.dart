import 'package:flutter_app/app_helpers/app_utils.dart';

class NewsViewModel {
  String? id;
  String? title;
  String? image;
  String? subject;
  String? date;
  String? content;
  String? description;
  String? url;

  NewsViewModel({
    required this.id,
    this.title,
    this.image,
    this.subject,
    this.date,
    this.content,
    this.description,
    this.url,
  });

  NewsViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json[r'title'] != null ? json[r'title'] : '';
    image = json['image'] != null ? json['image']['url'] ?? null : null;
    date = json['datePublished'] != null ? AppUtils.timeToString(json['datePublished']) : '';
    content = json['body'] ?? '';
    url = json[r'url'];
  }
}
