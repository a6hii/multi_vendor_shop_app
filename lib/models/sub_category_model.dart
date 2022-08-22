import 'package:multi_vendor_shop_app/firebase_services/firebase_service.dart';

class SubCategory {
  SubCategory(
      {required this.mainCategory,
      required this.subcatName,
      required this.image});

  SubCategory.fromJson(Map<String, Object?> json)
      : this(
          mainCategory: json['mainCategory']! as String,
          subcatName: json['subcatName']! as String,
          image: json['image']! as String,
        );

  final String? mainCategory;
  final String? subcatName;
  final String? image;

  Map<String, Object?> toJson() {
    return {
      'mainCategory': mainCategory,
      'subcatName': subcatName,
      'image': image,
    };
  }
}

FirebaseService _service = FirebaseService();

subCategoryCollection({selectedSubCat}) {
  return _service.subCategories
      .where('active', isEqualTo: true)
      .where('mainCategory', isEqualTo: selectedSubCat)
      .withConverter<SubCategory>(
        fromFirestore: (snapshot, _) => SubCategory.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );
}
