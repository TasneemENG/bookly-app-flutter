class Pdf {
  final bool? isAvailable;

  Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) =>
      Pdf(
        isAvailable: json['isAvailable'] as bool?,
      );
}