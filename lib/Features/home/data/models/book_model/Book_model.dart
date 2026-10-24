import 'package:bookly/Features/home/domain/entities/book_entity.dart';

import 'VolumeInfo.dart';
import 'SaleInfo.dart';
import 'AccessInfo.dart';
import 'SearchInfo.dart';

/// kind : "books#volume"
/// id : "Pei5AF0ccGwC"
/// etag : "kT7whudKpCQ"
/// selfLink : "https://www.googleapis.com/books/v1/volumes/Pei5AF0ccGwC"
/// volumeInfo : {"title":"Computer Literature Bibliography: 1964-1967","authors":["W. W. Youden"],"publishedDate":"1965","industryIdentifiers":[{"type":"OTHER","identifier":"UOM:39015086416164"}],"readingModes":{"text":false,"image":true},"pageCount":392,"printType":"BOOK","categories":["Computers"],"maturityRating":"NOT_MATURE","allowAnonLogging":false,"contentVersion":"0.10.9.0.full.1","panelizationSummary":{"containsEpubBubbles":false,"containsImageBubbles":false},"imageLinks":{"smallThumbnail":"http://books.google.com/books/content?id=Pei5AF0ccGwC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api","thumbnail":"http://books.google.com/books/content?id=Pei5AF0ccGwC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"},"language":"en","previewLink":"http://books.google.com.eg/books?id=Pei5AF0ccGwC&pg=PA234&dq=programming&hl=&cd=1&source=gbs_api","infoLink":"https://play.google.com/store/books/details?id=Pei5AF0ccGwC&source=gbs_api","canonicalVolumeLink":"https://play.google.com/store/books/details?id=Pei5AF0ccGwC"}
/// saleInfo : {"country":"EG","saleability":"FREE","isEbook":true,"buyLink":"https://play.google.com/store/books/details?id=Pei5AF0ccGwC&rdid=book-Pei5AF0ccGwC&rdot=1&source=gbs_api"}
/// accessInfo : {"country":"EG","viewability":"ALL_PAGES","embeddable":true,"publicDomain":true,"textToSpeechPermission":"ALLOWED","epub":{"isAvailable":false,"downloadLink":"http://books.google.com.eg/books/download/Computer_Literature_Bibliography_1964_19.epub?id=Pei5AF0ccGwC&hl=&output=epub&source=gbs_api"},"pdf":{"isAvailable":false},"webReaderLink":"http://play.google.com/books/reader?id=Pei5AF0ccGwC&hl=&source=gbs_api","accessViewStatus":"FULL_PUBLIC_DOMAIN","quoteSharingAllowed":false}
/// searchInfo : {"textSnippet":"W. W. Youden. FURTHER U.S. WORK AFFECTING <b>PROGRAMMING</b> LANGUAGES A FORMAL SEMANTICS FOR <b>PROGRAMMING</b> LANGUAGES <b>PROGRAMMING</b> LANGUAGES <b>PROGRAMMING</b> SYSTEMS AND <b>PROGRAMMING</b> LANGUAGES THE STRUCTURE OF <b>PROGRAMMING</b> LANGUAGES SEMIOTICS AND&nbsp;..."}

class BookModel extends BookEntity {
  BookModel({
      this.kind, 
      this.id, 
      this.etag, 
      this.selfLink, 
      this.volumeInfo, 
      this.saleInfo, 
      this.accessInfo, 
      this.searchInfo,}) : super(bookId: id!,
      image: volumeInfo?.imageLinks?.thumbnail ?? '',
      authorName: volumeInfo!.authors!.first,
      price: 0.0,
      rating: volumeInfo.averageRating,
      title: volumeInfo?.title ?? 'No Title');

  BookModel.fromJson(dynamic json)
      : super(
    bookId: json['id'],
    image: json['volumeInfo']?['imageLinks']?['thumbnail'] ?? '',
    authorName: (json['volumeInfo']?['authors'] as List?)?.first ?? 'No Name',
    price: 0.0,
    rating: json['volumeInfo']?['averageRating'],
    title: json['volumeInfo']?['title'],
  )
  {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null;
    saleInfo = json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null;
    searchInfo = json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null;
  }
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }

}