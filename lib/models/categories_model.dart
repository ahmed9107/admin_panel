class CategoryModel {
  String? status;
  late List<CategoriesData> categoryData;

  CategoryModel({this.status, required this.categoryData});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      categoryData = <CategoriesData>[];
      json['data'].forEach((v) {
        categoryData.add(CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = categoryData.map((v) => v.toJson()).toList();
    return data;
  }
}

class CategoriesData {
  String? id;
  String? name;
  String? nameAr;
  String? nameFr;
  String? image;

  CategoriesData(
      {this.id,
      this.name,
      this.nameAr,
      this.nameFr,
      this.image});

  CategoriesData.fromJson(Map<String, dynamic> json) {
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
