class ProductListBaseResponse {

  ProductListBaseResponse({
      this.id, 
      this.name, 
      this.barcode, 
      this.description, 
      this.subCategory, 
      this.brand, 
      this.quantity, 
      this.productPrice, 
      this.image,});

  ProductListBaseResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    barcode = json['barcode'];
    description = json['description'];
    subCategory = json['subCategory'] != null ? SubCategory.fromJson(json['subCategory']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    quantity = json['quantity'] != null ? Quantity.fromJson(json['quantity']) : null;
    productPrice = json['productPrice'] != null ? ProductPrice.fromJson(json['productPrice']) : null;
    image = json['image'];
  }
  int? id;
  String? name;
  String? barcode;
  String? description;
  SubCategory? subCategory;
  Brand? brand;
  Quantity? quantity;
  ProductPrice? productPrice;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['barcode'] = barcode;
    map['description'] = description;
    if (subCategory != null) {
      map['subCategory'] = subCategory?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    if (quantity != null) {
      map['quantity'] = quantity?.toJson();
    }
    if (productPrice != null) {
      map['productPrice'] = productPrice?.toJson();
    }
    map['image'] = image;
    return map;
  }

}

class ProductPrice {
  ProductPrice({
      this.id, 
      this.price, 
      this.unitPrice, 
      this.mrp,});

  ProductPrice.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    unitPrice = json['unitPrice'];
    mrp = json['mrp'];
  }
  int? id;
  double? price;
  double? unitPrice;
  double? mrp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['unitPrice'] = unitPrice;
    map['mrp'] = mrp;
    return map;
  }

}

class Quantity {
  Quantity({
      this.id, 
      this.quantity, 
      this.unit, 
      this.unitValue, 
      this.pastQuantity,});

  Quantity.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    unit = json['unit'];
    unitValue = json['unitValue'];
    pastQuantity = json['pastQuantity'];
  }
  int? id;
  int? quantity;
  String? unit;
  double? unitValue;
  int? pastQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['unit'] = unit;
    map['unitValue'] = unitValue;
    map['pastQuantity'] = pastQuantity;
    return map;
  }

}

class Brand {
  Brand({
      this.id, 
      this.name, 
      this.description, 
      this.image,});

  Brand.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    return map;
  }

}

class SubCategory {
  SubCategory({
      this.id, 
      this.name, 
      this.image, 
      this.description, 
      this.category,});

  SubCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  int? id;
  String? name;
  dynamic image;
  String? description;
  Category? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

class Category {
  Category({
      this.id, 
      this.name, 
      this.image, 
      this.description,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }
  int? id;
  String? name;
  String? image;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    return map;
  }

}