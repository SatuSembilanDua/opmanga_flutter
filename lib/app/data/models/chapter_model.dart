class Chapter {
  String? img;

  Chapter({this.img});

  Chapter.fromJson(Map<String, dynamic> json) {
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['img'] = img;
    return data;
  }

  static List<Chapter> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Chapter.fromJson(e)).toList();
  }
}
