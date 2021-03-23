class ApodResponseModel {
  String date;
  String explanation;
  String hdurl;
  String media_type;
  String service_version;
  String title;
  String url;

  ApodResponseModel(
      {required this.date,
      required this.explanation,
      required this.hdurl,
      required this.media_type,
      required this.service_version,
      required this.title,
      required this.url});

  ApodResponseModel.fromJsonMap(Map<String, dynamic> map)
      : date = map["date"],
        explanation = map["explanation"],
        hdurl = map["hdurl"],
        media_type = map["media_type"],
        service_version = map["service_version"],
        title = map["title"],
        url = map["url"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['explanation'] = explanation;
    data['hdurl'] = hdurl;
    data['media_type'] = media_type;
    data['service_version'] = service_version;
    data['title'] = title;
    data['url'] = url;
    return data;
  }
}
