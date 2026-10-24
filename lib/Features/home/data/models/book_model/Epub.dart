/// isAvailable : false
/// downloadLink : "http://books.google.com.eg/books/download/Computer_Literature_Bibliography_1964_19.epub?id=Pei5AF0ccGwC&hl=&output=epub&source=gbs_api"

class Epub {
  Epub({
      this.isAvailable, 
      this.downloadLink,});

  Epub.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
    downloadLink = json['downloadLink'];
  }
  bool? isAvailable;
  String? downloadLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    map['downloadLink'] = downloadLink;
    return map;
  }

}