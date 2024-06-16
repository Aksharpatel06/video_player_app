class Video {
  final String description;
  final String sources;
  final String subtitle;
  final String thumb;
  final String title;

  Video({required this.description, required this.sources, required this.subtitle, required this.thumb, required this.title});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        description: json['description'],
        sources: json['sources'],
        subtitle: json['subtitle'],
        thumb: json['thumb'],
        title: json['title']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'sources': sources,
      'subtitle': subtitle,
      'thumb': thumb,
      'title': title
    };
  }
}