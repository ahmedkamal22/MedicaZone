class HomeModel {
  bool? success;
  int? code;
  String? locale;
  String? message;
  Data? data;

  HomeModel({this.success, this.code, this.locale, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    locale = json['locale'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<HomeData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <HomeData>[];
      json['data'].forEach((v) {
        data!.add(new HomeData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class HomeData {
  int? id;
  int? brandId;
  int? categoryId;
  int? subcategoryId;
  Null? subsubcategoryId;
  String? productNameEn;
  String? productNameAr;
  String? productSlugEn;
  String? productSlugAr;
  String? productCode;
  String? productQty;
  List<String>? productTagsEn;
  List<String>? productTagsAr;
  List<String>? productSizeEn;
  List<String>? productSizeAr;
  List<String>? productColorEn;
  List<String>? productColorAr;
  String? sellingPrice;
  String? discountPrice;
  String? shortDescpEn;
  String? shortDescpAr;
  String? longDescpEn;
  String? longDescpAr;
  String? productThambnail;
  int? hotDeals;
  int? featured;
  int? specialOffer;
  int? specialDeals;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? adminsId;
  int? rate;
  Brand? brand;
  Category? category;

  HomeData(
      {this.id,
      this.brandId,
      this.categoryId,
      this.subcategoryId,
      this.subsubcategoryId,
      this.productNameEn,
      this.productNameAr,
      this.productSlugEn,
      this.productSlugAr,
      this.productCode,
      this.productQty,
      this.productTagsEn,
      this.productTagsAr,
      this.productSizeEn,
      this.productSizeAr,
      this.productColorEn,
      this.productColorAr,
      this.sellingPrice,
      this.discountPrice,
      this.shortDescpEn,
      this.shortDescpAr,
      this.longDescpEn,
      this.longDescpAr,
      this.productThambnail,
      this.hotDeals,
      this.featured,
      this.specialOffer,
      this.specialDeals,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.adminsId,
      this.rate,
      this.brand,
      this.category});

  HomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandId = json['brand_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subsubcategoryId = json['subsubcategory_id'];
    productNameEn = json['product_name_en'];
    productNameAr = json['product_name_ar'];
    productSlugEn = json['product_slug_en'];
    productSlugAr = json['product_slug_ar'];
    productCode = json['product_code'];
    productQty = json['product_qty'];
    productTagsEn = json['product_tags_en'].cast<String>();
    productTagsAr = json['product_tags_ar'].cast<String>();
    productSizeEn = json['product_size_en'].cast<String>();
    productSizeAr = json['product_size_ar'].cast<String>();
    productColorEn = json['product_color_en'].cast<String>();
    productColorAr = json['product_color_ar'].cast<String>();
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    shortDescpEn = json['short_descp_en'];
    shortDescpAr = json['short_descp_ar'];
    longDescpEn = json['long_descp_en'];
    longDescpAr = json['long_descp_ar'];
    productThambnail = json['product_thambnail'];
    hotDeals = json['hot_deals'];
    featured = json['featured'];
    specialOffer = json['special_offer'];
    specialDeals = json['special_deals'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminsId = json['admins_id'];
    rate = json['rate'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }
}

class Brand {
  int? id;
  String? brandNameEn;
  String? brandNameAr;
  String? brandSlugEn;
  String? brandSlugAr;
  String? brandImage;
  String? createdAt;
  String? updatedAt;
  int? adminsId;

  Brand(
      {this.id,
      this.brandNameEn,
      this.brandNameAr,
      this.brandSlugEn,
      this.brandSlugAr,
      this.brandImage,
      this.createdAt,
      this.updatedAt,
      this.adminsId});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandNameEn = json['brand_name_en'];
    brandNameAr = json['brand_name_ar'];
    brandSlugEn = json['brand_slug_en'];
    brandSlugAr = json['brand_slug_ar'];
    brandImage = json['brand_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminsId = json['admins_id'];
  }
}

class Category {
  int? id;
  String? categoryNameEn;
  String? categoryNameAr;
  String? categorySlugEn;
  String? categorySlugAr;
  String? categoryIcon;
  String? createdAt;
  String? updatedAt;
  int? adminsId;

  Category(
      {this.id,
      this.categoryNameEn,
      this.categoryNameAr,
      this.categorySlugEn,
      this.categorySlugAr,
      this.categoryIcon,
      this.createdAt,
      this.updatedAt,
      this.adminsId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryNameEn = json['category_name_en'];
    categoryNameAr = json['category_name_ar'];
    categorySlugEn = json['category_slug_en'];
    categorySlugAr = json['category_slug_ar'];
    categoryIcon = json['category_icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminsId = json['admins_id'];
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
