import 'package:bookly_app/features/home/data/models/books/volume_info.dart';

class Books {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  // final SaleInfo? saleInfo;
  // final AccessInfo? accessInfo;

  Books({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    // this.saleInfo,
    // this.accessInfo,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      // saleInfo: json['saleInfo'] == null
      //     ? null
      //     : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
      // accessInfo: json['accessInfo'] == null
      //     ? null
      //     : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
    );
  }
}
