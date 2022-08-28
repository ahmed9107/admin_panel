class ManageCustomerModel{
  String? id;
  String name;
  String email;
  String phone;
  String password;
  
  ManageCustomerModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'userid': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}