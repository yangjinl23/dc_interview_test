class LanguageModel {
  final String title;
  final String description;
  final String image;
  final String url;
  final String category;

  LanguageModel({
    required this.title,
    required this.description,
    required this.image,
    required this.url,
    required this.category,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      url: json['url'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'url': url,
      'category': category,
    };
  }
}
