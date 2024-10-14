class GroceryItemModel {
  String? imageURL;
  String? itemName;
  String? companyProduced;
  double? oldPrice;
  double? newPrice;
  int? discountPercentage;
  String? store;
  String? location;
  String? productDescription;

  GroceryItemModel(
      {this.imageURL,
      this.itemName,
      this.companyProduced,
      this.oldPrice,
      this.newPrice,
      this.discountPercentage,
      this.store,
      this.location,
      this.productDescription});

  GroceryItemModel.fromJson(Map<String, dynamic> json) {
    imageURL = json['imageURL'];
    itemName = json['itemName'];
    companyProduced = json['companyProduced'];
    oldPrice = json['oldPrice'];
    newPrice = json['newPrice'];
    discountPercentage = json['discountPercentage'];
    store = json['store'];
    location = json['location'];
    productDescription = json['productDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageURL'] = imageURL;
    data['itemName'] = itemName;
    data['companyProduced'] = companyProduced;
    data['oldPrice'] = oldPrice;
    data['newPrice'] = newPrice;
    data['discountPercentage'] = discountPercentage;
    data['store'] = store;
    data['location'] = location;
    data['productDescription'] = productDescription;
    return data;
  }
}
