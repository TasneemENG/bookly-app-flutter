class ReadingModes {
  final bool? text;
  final bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      ReadingModes(
        text: json['text'] as bool?,
        image: json['image'] as bool?,
      );
}
