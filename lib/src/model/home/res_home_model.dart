class ResHomeModel {
  final String? name;
  final String? email;
  final int? phone;

  ResHomeModel({this.name, this.email, this.phone});

  factory ResHomeModel.fromJson(Map<String, dynamic> json) => ResHomeModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
      };
}
