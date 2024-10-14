class GroceryItemModel {
  String? imageURL;
  String? itemName;
  String? companyProduced;
  double? oldPrice;
  double? newPrice;
  int? discountPercentage;

  GroceryItemModel(
      {this.imageURL,
      this.itemName,
      this.companyProduced,
      this.oldPrice,
      this.newPrice,
      this.discountPercentage});

  GroceryItemModel.fromJson(Map<String, dynamic> json) {
    imageURL = json['imageURL'];
    itemName = json['itemName'];
    companyProduced = json['companyProduced'];
    oldPrice = json['oldPrice'];
    newPrice = json['newPrice'];
    discountPercentage = json['discountPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageURL'] = imageURL;
    data['itemName'] = itemName;
    data['companyProduced'] = companyProduced;
    data['oldPrice'] = oldPrice;
    data['newPrice'] = newPrice;
    data['discountPercentage'] = discountPercentage;
    return data;
  }
}
