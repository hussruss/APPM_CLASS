abstract class Media {
  final String thumbnail;
  final String title;
  final String description;
  final String chanel;
  final String chanelUrl;
  final String videoUrl;
  final int likes;
  final String views;
  final DateTime date;

  Media(
      {required this.title,
      required this.description,
      required this.chanel,
      required this.chanelUrl,
      required this.likes,
      required this.thumbnail,
      required this.videoUrl,
      required this.views,
      required this.date});
}

class Video extends Media {
  Video(
      {required super.title,
      required super.description,
      required super.chanel,
      required super.chanelUrl,
      required super.likes,
      required super.thumbnail,
      required super.videoUrl,
      required super.views,
      required super.date});
}

class Short extends Media {
  Short(
      {required super.title,
      required super.description,
      required super.chanel,
      required super.chanelUrl,
      required super.likes,
      required super.thumbnail,
      required super.videoUrl,
      required super.views,
      required super.date});
}
