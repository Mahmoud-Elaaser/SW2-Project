class UserModel {
  String? id;
  String? email;
  int? age;
  String? name;
  String? address;

  UserModel({this.id, this.address, this.name,this. age,this.email});

  UserModel.fromJson(Map map) {
    id = map['id'].toString();
    address = map['address'];
    email = map['email'];
    age = map['age'];
    name = map['name'];
  }
}
