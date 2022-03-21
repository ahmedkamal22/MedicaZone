class SliderModel {
  bool? status;
  String? message;
  List<Data>? data;

  SliderModel({this.status, this.message, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? sliderImg;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? adminsId;

  Data(
      {this.id,
      this.sliderImg,
      this.title,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.adminsId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sliderImg = json['slider_img'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminsId = json['admins_id'];
  }
}
