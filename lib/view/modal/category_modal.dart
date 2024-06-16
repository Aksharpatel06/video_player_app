import 'package:video_player_app/view/modal/video_modal.dart';

class Category {
  final String name;
  final List<Video> videos;

  Category({required this.name, required this.videos});

  factory Category.fromJson(Map<String, dynamic> json) {
    var list = json['videos'] as List;
    List<Video> videosList = list.map((i) => Video.fromJson(i)).toList();
    return Category(name: json['name'], videos: videosList);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> videosList = videos.map((i) => i.toJson()).toList();
    return {'name': name, 'videos': videosList};
  }
}

class Media {
  final List<Category> categories;

  Media({required this.categories});

  factory Media.fromJson(Map<String, dynamic> json) {
    var list = json['categories'] as List;
    List<Category> categoriesList = list.map((i) => Category.fromJson(i)).toList();
    return Media(categories: categoriesList);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> categoriesList = categories.map((i) => i.toJson()).toList();
    return {'categories': categoriesList};
  }
}