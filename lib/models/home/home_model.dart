class HomeModel {
  bool? status;
  String? message;
  AllData? allData;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    allData = json['data'] != null ? new AllData.fromJson(json['data']) : null;
  }
}

class AllData {
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

  AllData.fromJson(Map<String, dynamic> json) {
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
  String? productTagsEn;
  String? productTagsAr;
  String? productSizeEn;
  String? productSizeAr;
  String? productColorEn;
  String? productColorAr;
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
  Brand? brand;
  Category? category;

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
    productTagsEn = json['product_tags_en'];
    productTagsAr = json['product_tags_ar'];
    productSizeEn = json['product_size_en'];
    productSizeAr = json['product_size_ar'];
    productColorEn = json['product_color_en'];
    productColorAr = json['product_color_ar'];
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

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandNameEn = json['brand_name_en'];
    brandNameAr = json['brand_name_ar'];
    brandSlugEn = json['brand_slug_en'];
    brandSlugAr = json['brand_slug_ar'];
    brandImage = json['brand_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Category {
  int? id;
  String? categoryNameEn;
  String? categoryNameAr;
  String? categorySlugEn;
  String? categorySlugAr;
  Null? categoryIcon;
  String? createdAt;
  String? updatedAt;

  Category.fromJson(Map<String, dynamic> json) {
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

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
