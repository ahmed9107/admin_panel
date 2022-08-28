class CategoryModel {
  String? status;
  List<CategoryData>? data;

  CategoryModel({this.status, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  String? id;
  String? name;
  String? nameAr;
  String? nameFr;
  String? image;

  CategoryData(
      {this.id,
      this.name,
      this.nameAr,
      this.nameFr,
      this.image});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id      = json['categories_id'];
    name    = json['categories_name'];
    nameAr  = json['categories_name_ar'];
    nameFr  = json['categories_name_fr'];
    image   = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id']       = id;
    data['categories_name']     = name;
    data['categories_name_ar']  = nameAr;
    data['categories_name_fr']  = nameFr;
    data['categories_image']    = image;
    return data;
  }
}
