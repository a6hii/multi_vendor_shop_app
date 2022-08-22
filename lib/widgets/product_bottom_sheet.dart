import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multi_vendor_shop_app/models/product_model.dart';

class ProductBottomSheet extends StatelessWidget {
  final Product? product;
  const ProductBottomSheet({Key? key, this.product}) : super(key: key);

  Widget _customContainer({String? label, String? text}) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          style: const TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 6, 0, 6),
          child: Row(
            children: [
              const Icon(
                Icons.circle,
                size: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text!,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            elevation: 0,
            automaticallyImplyLeading: false, //hides back button
            backgroundColor: Colors.white,
            title: const Text(
              'Specifications',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product!.brand != null)
                  _customContainer(
                    label: 'Brand:',
                    text: product!.brand!,
                  ),
                if (product!.brandDescription != null)
                  _customContainer(
                    label: 'Brand Details:',
                    text: product!.brandDescription!,
                  ),
                if (product!.sku != null)
                  _customContainer(
                    label: 'SKU:',
                    text: product!.sku!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
