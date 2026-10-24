/// country : "EG"
/// saleability : "FREE"
/// isEbook : true
/// buyLink : "https://play.google.com/store/books/details?id=Pei5AF0ccGwC&rdid=book-Pei5AF0ccGwC&rdot=1&source=gbs_api"

class SaleInfo {
  SaleInfo({
      this.country, 
      this.saleability, 
      this.isEbook, 
      this.buyLink,});

  SaleInfo.fromJson(dynamic json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    buyLink = json['buyLink'];
  }
  String? country;
  String? saleability;
  bool? isEbook;
  String? buyLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['saleability'] = saleability;
    map['isEbook'] = isEbook;
    map['buyLink'] = buyLink;
    return map;
  }

}