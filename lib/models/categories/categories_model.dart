class CategoriesModel {
  bool? success;
  int? code;
  String? locale;
  String? message;
  Data? data;

  CategoriesModel(
      {this.success, this.code, this.locale, this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    locale = json['locale'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<CategoryItems>? items;

  Data({this.items});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <CategoryItems>[];
      json['items'].forEach((v) {
        items!.add(new CategoryItems.fromJson(v));
      });
    }
  }
}

class CategoryItems {
  int? id;
  String? categoryNameEn;
  String? categoryNameAr;
  String? categorySlugEn;
  String? categorySlugAr;
  Null? categoryIcon;
  String? createdAt;
  String? updatedAt;
  int? adminsId;
  List<Subcategory>? subcategory;
  List<Subsubcategory>? subsubcategory;

  CategoryItems(
      {this.id,
      this.categoryNameEn,
      this.categoryNameAr,
      this.categorySlugEn,
      this.categorySlugAr,
      this.categoryIcon,
      this.createdAt,
      this.updatedAt,
      this.adminsId,
      this.subcategory,
      this.subsubcategory});

  CategoryItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryNameEn = json['category_name_en'];
    categoryNameAr = json['category_name_ar'];
    categorySlugEn = json['category_slug_en'];
    categorySlugAr = json['category_slug_ar'];
    categoryIcon = json['category_icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminsId = json['admins_id'];
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new Subcategory.fromJson(v));
      });
    }
    if (json['subsubcategory'] != null) {
      subsubcategory = <Subsubcategory>[];
      json['subsubcategory'].forEach((v) {
        subsubcategory!.add(new Subsubcategory.fromJson(v));
      });
    }
  }
}

class Subcategory {
  int? id;
  int? categoryId;
  String? subcategoryNameEn;
  String? subcategoryNameAr;
  String? subcategorySlugEn;
  String? subcategorySlugAr;
  String? createdAt;
  String? updatedAt;
  int? adminsId;

  Subcategory(
      {this.id,
      this.categoryId,
      this.subcategoryNameEn,
      this.subcategoryNameAr,
      this.subcategorySlugEn,
      this.subcategorySlugAr,
      this.createdAt,
      this.updatedAt,
      this.adminsId});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryNameEn = json['subcategory_name_en'];
    subcategoryNameAr = json['subcategory_name_ar'];
    subcategorySlugEn = json['subcategory_slug_en'];
    subcategorySlugAr = json['subcategory_slug_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminsId = json['admins_id'];
  }
}

class Subsubcategory {
  int? id;
  int? categoryId;
  int? subcategoryId;
  String? subsubcategoryNameEn;
  String? subsubcategoryNameAr;
  String? subsubcategorySlugEn;
  String? subsubcategorySlugAr;
  String? createdAt;
  String? updatedAt;
  int? adminsId;

  Subsubcategory(
      {this.id,
      this.categoryId,
      this.subcategoryId,
      this.subsubcategoryNameEn,
      this.subsubcategoryNameAr,
      this.subsubcategorySlugEn,
      this.subsubcategorySlugAr,
      this.createdAt,
      this.updatedAt,
      this.adminsId});

  Subsubcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subsubcategoryNameEn = json['subsubcategory_name_en'];
    subsubcategoryNameAr = json['subsubcategory_name_ar'];
    subsubcategorySlugEn = json['subsubcategory_slug_en'];
    subsubcategorySlugAr = json['subsubcategory_slug_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminsId = json['admins_id'];
  }
}
