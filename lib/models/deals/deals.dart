class DealsModel {
  bool? status;
  String? message;
  List<Data> data = [];

  DealsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
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
      this.updatedAt});

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
  }
}
