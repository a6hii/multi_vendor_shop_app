import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:multi_vendor_shop_app/models/product_model.dart';
import 'package:multi_vendor_shop_app/screens/product_details_screen.dart';

class HomeProductList extends StatelessWidget {
  final String? category;
  const HomeProductList({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: FirestoreQueryBuilder<Product>(
        query: productQuery(
          category: category,
        ),
        builder: (context, snapshot, _) {
          // ...

          return GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1 / 1.23),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              // if we reached the end of the currently obtained items, we try to
              // obtain more items
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                // Tell FirestoreQueryBuilder to try to obtain more items.
                // It is safe to call this function from within the build method.
                snapshot.fetchMore();
              }

              var productIndex = snapshot.docs[index];
              Product product = productIndex.data();
              String productId = productIndex.id;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          transitionDuration: const Duration(
                              milliseconds:
                                  500), //controlling the animation of transition to product details screen
                          pageBuilder: (context, _, __) {
                            return ProductDetailScreen(
                              product: product,
                              productId: productId,
                            );
                          }),
                    );
                  },
                  child: Container(
                    //height: 200,
                    //width: 200,
                    padding: const EdgeInsets.all(8),

                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 60,
                            width: 80,
                            child: Hero(
                              tag: product.imageUrls![0],
                              child: CachedNetworkImage(
                                imageUrl: product.imageUrls![0],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.productName!,
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
