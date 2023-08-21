class AllChapter {
  String? id;
  String? judul;
  String? date;
  String? link;
  String? dLink;
  String? dateAct;
  String? token;

  AllChapter(
      {this.id,
      this.judul,
      this.date,
      this.link,
      this.dLink,
      this.dateAct,
      this.token});

  AllChapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    date = json['date'];
    link = json['link'];
    dLink = json['d_link'];
    dateAct = json['date_act'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['date'] = date;
    data['link'] = link;
    data['d_link'] = dLink;
    data['date_act'] = dateAct;
    data['token'] = token;
    return data;
  }

  static List<AllChapter> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => AllChapter.fromJson(e)).toList();
  }
}
