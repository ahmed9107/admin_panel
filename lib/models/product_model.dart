class ProductModel {
  String? status;
  late List<ProductData> data;

  ProductModel({this.status, required this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class ProductData {
  String? id;
  String? name;
  String? nameAr;
  String? nameFr;
  String? description;
  String? descriptionAr;
  String? descriptionFr;
  String? price;
  String? count;
  String? active;
  String? discount;
  String? addDate;
  String? image;
  String? itemsRating;
  String? catId;

  ProductData(
    {this.id,
    this.name,
    this.nameAr,
    this.nameFr,
    this.description,
    this.descriptionAr,
    this.descriptionFr,
    this.price,
    this.count,
    this.active,
    this.discount,
    this.addDate,
    this.image,
    this.itemsRating,
    this.catId});

  ProductData.fromJson(Map<String, dynamic> json) {
    id            = json['items_id'];
    name          = json['items_name'];
    nameAr        = json['items_name_ar'];
    nameFr        = json['items_name_fr'];
    description   = json['items_description'];
    descriptionAr = json['items_description_ar'];
    descriptionFr = json['items_description_fr'];
    price         = json['items_price'];
    count         = json['items_count'];
    active        = json['items_active'];
    discount      = json['items_discount'];
    addDate       = json['items_add_date'];
    image         = json['items_image'];
    itemsRating   = json['items_rating'];
    catId         = json['items_cat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id']              = id;
    data['items_name']            = name;
    data['items_name_ar']         = nameAr;
    data['items_name_fr']         = nameFr;
    data['items_description']     = description;
    data['items_description_ar']  = descriptionAr;
    data['items_description_fr']  = descriptionFr;
    data['items_price']           = price;
    data['items_count']           = count;
    data['items_active']          = active;
    data['items_discount']        = discount;
    data['items_add_date']        = addDate;
    data['items_image']           = image;
    data['items_rating']          = itemsRating;
    data['items_cat_id']          = catId;
    return data;
  }
}
