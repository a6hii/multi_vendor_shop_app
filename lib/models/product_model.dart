//for product list page

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  Product(
      {this.approved,
      this.productName,
      this.regularPrice,
      this.salesPrice,
      this.taxStatus,
      this.taxPercentage,
      this.category,
      this.mainCategory,
      this.subCategory,
      this.description,
      this.scheduledDate,
      this.sku,
      this.manageInventory,
      this.stockOnHand,
      this.reOrderLevel,
      this.isShippingChargeable,
      this.shippingCharge,
      this.brand,
      this.brandDescription,
      this.sizeList,
      this.unit,
      this.imageUrls,
      this.seller,
      this.productId});

  Product.fromJson(Map<String, Object?> json)
      : this(
          approved: json['approved']! as bool,
          productName: json['productName']! as String,
          regularPrice: json['regularPrice']! as int,
          salesPrice: json['salesPrice']! as int,
          taxStatus: json['taxStatus']! as String,
          taxPercentage: json['taxPercentage'] == null
              ? null
              : json['taxPercentage']! as double,
          category:
              json['category'] == null ? null : json['category']! as String,
          subCategory: json['subCategory'] == null
              ? null
              : json['subCategory']! as String,
          mainCategory: json['mainCategory'] == null
              ? null
              : json['mainCategory']! as String,
          description: json['description'] == null
              ? null
              : json['description']! as String,
          scheduledDate: json['scheduledDate'] == null
              ? null
              : json['scheduledDate']! as Timestamp,
          sku: json['sku'] == null ? null : json['sku']! as String,
          manageInventory: json['manageInventory'] == null
              ? null
              : json['manageInventory']! as bool,
          stockOnHand:
              json['stockOnHand'] == null ? null : json['stockOnHand']! as int,
          reOrderLevel: json['reOrderLevel'] == null
              ? null
              : json['reOrderLevel']! as int,
          isShippingChargeable: json['isShippingChargeable'] == null
              ? null
              : json['isShippingChargeable']! as bool,
          shippingCharge: json['shippingCharge'] == null
              ? null
              : json['shippingCharge']! as int,
          brand: json['brand'] == null ? null : json['brand']! as String,
          brandDescription: json['brandDescription'] == null
              ? null
              : json['brandDescription']! as String,
          sizeList: json['size'] == null ? null : json['size']! as List,
          unit: json['unit']! as String,
          imageUrls: json['imageUrls']! as List,
          seller: json['seller']! as Map,
        );
  final bool? approved;
  final String? productName;
  final int? regularPrice;
  final int? salesPrice;
  final String? taxStatus;
  final double? taxPercentage; //should be double
  final String? category;
  final String? mainCategory;
  final String? subCategory;
  final String? description;
  final Timestamp? scheduledDate;
  final String? sku;
  final bool? manageInventory;
  final int? stockOnHand; //soh in tutorial
  final int? reOrderLevel;
  final bool? isShippingChargeable;
  final int? shippingCharge;
  final String? brand;
  final String? brandDescription;
  final List? sizeList;
  final String? unit;
  final List? imageUrls;
  final Map? seller;
  final String? productId;

  Map<String, Object?> toJson() {
    return {
      'approved': approved,
      'productName': productName,
      'regularPrice': regularPrice,
      'salesPrice': salesPrice,
      'taxStatus': taxStatus,
      'taxPercentage': taxPercentage,
      'category': category,
      'subCategory': subCategory,
      'mainCategory': mainCategory,
      'description': description,
      'scheduledDate': scheduledDate,
      'sku': sku,
      'manageInventory': manageInventory,
      'stockOnHand': stockOnHand,
      'reOrderLevel': reOrderLevel,
      'isShippingChargeable': isShippingChargeable,
      'shippingCharge': shippingCharge,
      'brand': brand,
      'brandDescription': brandDescription,
      'size': sizeList,
      'unit': unit,
      'imageUrls': imageUrls,
      'seller': seller,
    };
  }
}

productQuery({category}) {
  return FirebaseFirestore.instance
      .collection('product')
      .where('approved', isEqualTo: true)
      .where('category', isEqualTo: category)
      .withConverter<Product>(
        fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
        toFirestore: (product, _) => product.toJson(),
      );
}
