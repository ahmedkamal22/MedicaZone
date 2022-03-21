class CategoriesModel {
  bool? status;
  String? message;
  Data? data;

  CategoriesModel({this.status, this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<CategoriesData> data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links> links = [];
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data'].forEach((v) {
      data.add(CategoriesData.fromJson(v));
    });

    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    json['links'].forEach((v) {
      links.add(Links.fromJson(v));
    });

    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class CategoriesData {
  int? id;
  String? categoryNameEn;
  String? categoryNameAr;
  String? categorySlugEn;
  String? categorySlugAr;
  Null? categoryIcon;
  String? createdAt;
  String? updatedAt;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryNameEn = json['category_name_en'];
    categoryNameAr = json['category_name_ar'];
    categorySlugEn = json['category_slug_en'];
    categorySlugAr = json['category_slug_ar'];
    categoryIcon = json['category_icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}