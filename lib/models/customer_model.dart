class CustomerModel {
  String? status;
  late List<CustomerData> customerData;

  CustomerModel({this.status, required this.customerData});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      customerData = <CustomerData>[];
      json['data'].forEach((v) {
        customerData.add(CustomerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = customerData.map((v) => v.toJson()).toList();
    return data;
  }
}

class CustomerData {
  String? id;
  String? name;
  String? password;
  String? email;
  String? phone;
  String? avatar;
  String? verifycode;
  String? approved;
  String? createdAt;

  CustomerData(
    {this.id,
    this.name,
    this.password,
    this.email,
    this.phone,
    this.avatar,
    this.verifycode,
    this.approved,
    this.createdAt});

  CustomerData.fromJson(Map<String, dynamic> json) {
    id          = json['users_id'];
    name        = json['users_name'];
    password    = json['users_password'];
    email       = json['users_email'];
    phone       = json['users_phone'];
    avatar      = json['users_avatar'];
    verifycode  = json['users_verifycode'];
    approved    = json['users_approved'];
    createdAt   = json['users_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_id']          = id;
    data['users_name']        = name;
    data['users_password']    = password;
    data['users_email']       = email;
    data['users_phone']       = phone;
    data['users_avatar']      = avatar;
    data['users_verifycode']  = verifycode;
    data['users_approved']    = approved;
    data['users_created_at']  = createdAt;
    return data;
  }
}