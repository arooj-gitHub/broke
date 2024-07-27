class CarModel {
  CarModel({
    this.id,
      this.name, 
      this.image, 
      this.rating, 
      this.price, 
      this.location,});

  CarModel.fromJson(dynamic json) {
    id=json['id'];
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
    price = json['price'];
    location = json['location'];
  }
  String? name;
  String? image;
  double? rating;
  double? price;
  String? location;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id']=id;
    map['name'] = name;
    map['image'] = image;
    map['rating'] = rating;
    map['price'] = price;
    map['location'] = location;
    return map;
  }

}