class SearchModel {
  bool? success;
  int? code;
  String? locale;
  String? message;
  SearchData? data;

  SearchModel({this.success, this.code, this.locale, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    locale = json['locale'];
    message = json['message'];
    data = json['data'] != null ? new SearchData.fromJson(json['data']) : null;
  }


}

class SearchData {
  int? currentPage;
  List<Data>? data;
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

  SearchData(
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

  SearchData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  int? brandId;
  int? categoryId;
  int? subcategoryId;
  int? subsubcategoryId;
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
  double? rate;

  Data(
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
        this.rate});

  Data.fromJson(Map<String, dynamic> json) {
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
    productTagsEn = ['x'];// json['product_tags_en'].cast<String>();
    productTagsAr = ['x'];// json['product_tags_ar'].cast<String>();
    productSizeEn = ['x'];// json['product_size_en'].cast<String>();
    productSizeAr = ['x'];// json['product_size_ar'].cast<String>();
    productColorEn = ['x'];// json['product_color_en'].cast<String>();
    productColorAr = ['x'];// json['product_color_ar'].cast<String>();
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
    rate =  double.tryParse(json['rate'].toString());
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
