/// textSnippet : "W. W. Youden. FURTHER U.S. WORK AFFECTING <b>PROGRAMMING</b> LANGUAGES A FORMAL SEMANTICS FOR <b>PROGRAMMING</b> LANGUAGES <b>PROGRAMMING</b> LANGUAGES <b>PROGRAMMING</b> SYSTEMS AND <b>PROGRAMMING</b> LANGUAGES THE STRUCTURE OF <b>PROGRAMMING</b> LANGUAGES SEMIOTICS AND&nbsp;..."

class SearchInfo {
  SearchInfo({
      this.textSnippet,});

  SearchInfo.fromJson(dynamic json) {
    textSnippet = json['textSnippet'];
  }
  String? textSnippet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textSnippet'] = textSnippet;
    return map;
  }

}