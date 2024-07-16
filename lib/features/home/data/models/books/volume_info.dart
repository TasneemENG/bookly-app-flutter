import 'package:bookly_app/features/home/data/models/books/dimensions.dart';
import 'package:bookly_app/features/home/data/models/books/industry_identifier.dart';
import 'package:bookly_app/features/home/data/models/books/panelization_summary.dart';
import 'package:bookly_app/features/home/data/models/books/reading_modes.dart';

import 'image_links.dart';

class VolumeInfo {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final int? printedPageCount;
  final Dimensions? dimensions;
  final String? printType;
  final List<String>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printedPageCount,
    this.dimensions,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String?,
    authors: json['authors'] != null
        ? _parseStringList(json['authors'])
        : null,
    publisher: json['publisher'] as String?,
    publishedDate: json['publishedDate'] as String?,
    description: json['description'] as String?,
    industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
        ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
        .toList(),
    readingModes: json['readingModes'] == null
        ? null
        : ReadingModes.fromJson(
        json['readingModes'] as Map<String, dynamic>),
    pageCount: json['pageCount'] as int?,
    printedPageCount: json['printedPageCount'] as int?,
    dimensions: json['dimensions'] == null
        ? null
        : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
    printType: json['printType'] as String?,
    categories: json['categories'] != null
        ? _parseStringList(json['categories'])
        : null,
    maturityRating: json['maturityRating'] as String?,
    allowAnonLogging: json['allowAnonLogging'] as bool?,
    contentVersion: json['contentVersion'] as String?,
    panelizationSummary: json['panelizationSummary'] == null
        ? null
        : PanelizationSummary.fromJson(
        json['panelizationSummary'] as Map<String, dynamic>),
    imageLinks: json['imageLinks'] == null
        ? null
        : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    language: json['language'] as String?,
    previewLink: json['previewLink'] as String?,
    infoLink: json['infoLink'] as String?,
    canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
  );

  static List<String>? _parseStringList(dynamic jsonValue) {
    if (jsonValue is List) {
      return jsonValue.map((e) => e.toString()).toList();
    } else if (jsonValue is String) {
      return [jsonValue];
    } else {
      return null;
    }
  }
}
