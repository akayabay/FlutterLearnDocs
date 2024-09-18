class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});


  // Json to dart sitesinden convert edilmiş bir model.
  // İlk eklemeden sonra uyarıları elle düzelt.

  // Ek kod yazılmaz
  // Çekilen verileri cast edip ilgili alanlara  atama
  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  // Ek kod yazılmaz
  // Post (veri yollama) için cast, servise json formatında veri yollamak için
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
