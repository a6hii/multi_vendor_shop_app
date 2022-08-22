import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor_shop_app/firebase_services/firebase_service.dart';
import 'package:multi_vendor_shop_app/models/product_model.dart';
import 'package:multi_vendor_shop_app/widgets/product_bottom_sheet.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product? product;
  final String? productId;
  const ProductDetailScreen({Key? key, this.product, this.productId})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final FirebaseService _service = FirebaseService();
  final store = GetStorage();
  ScrollController? _scrollController;
  int? pageNumber = 0;
  bool _isScrollDown = false;
  bool _showAppBar = true;
  String? _selectedSize;
  String? _address;
  @override
  void initState() {
    getDeliveryAddress();
    getSize();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollDown) {
          setState(() {
            _isScrollDown = true;
            _showAppBar = false;
          });
        }
      }
      if (_scrollController!.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollDown) {
          setState(() {
            _isScrollDown = false;
            _showAppBar = true;
          });
        }
      }
    });

    super.initState();
  }

  getSize() {
    if (widget.product!.sizeList!.isNotEmpty) {
      setState(() {
        _selectedSize = widget.product!.sizeList![0];
      });
    }
  }

  getDeliveryAddress() {
    String? address = store.read('address');
    if (address != null) {
      setState(() {
        _address = address;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: _showAppBar
            ? AppBar(
                //_isScrollDown is used so that appbar disappears when scrolled up
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.grey),
                actions: const [
                  CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black26,
                      child: Icon(
                        Icons.shopping_cart_checkout,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black26,
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            : null,
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  child: Stack(children: [
                    Hero(
                      tag: widget.product!.imageUrls![0],
                      child: PageView(
                        onPageChanged: ((value) {
                          setState(() {
                            pageNumber = value;
                          });
                        }),
                        children: widget.product!.imageUrls!.map((e) {
                          return CachedNetworkImage(imageUrl: e);
                        }).toList(),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black26,
                            radius: 16,
                            child: Text(
                              '${pageNumber! + 1}/${widget.product!.imageUrls!.length}',
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 12),
                            ),
                          ),
                        )),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rs: ${widget.product!.salesPrice != null ? _service.formattedPrice(widget.product!.salesPrice!) : _service.formattedPrice(widget.product!.regularPrice!)}',
                            style: const TextStyle(
                                fontSize: 18, color: Colors.orange),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  splashRadius: 18,
                                  splashColor: Colors.indigo.shade400,
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey.shade600,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  splashRadius: 18,
                                  splashColor: Colors.indigo.shade400,
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.grey.shade600,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      if (widget.product!.salesPrice != null)
                        Row(
                          children: [
                            Text(
                              'Rs: ${_service.formattedPrice(widget.product!.regularPrice!)}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${(((widget.product!.regularPrice! - widget.product!.salesPrice!) / widget.product!.regularPrice!) * 100.00).toStringAsFixed(0)}%',
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.product!.productName!,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.star_rate_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '(5)',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const Text('Description:'),
                      Text(widget.product!.description!),
                      const SizedBox(
                        height: 10,
                      ),
                      if (widget.product!.sizeList!.isNotEmpty &&
                          widget.product!.sizeList != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Variations/Units:',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Container(
                              height: 50,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: widget.product!.sizeList!.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlinedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  _selectedSize == e
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.white),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _selectedSize = e;
                                          });
                                        },
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                              color: _selectedSize == e
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ProductBottomSheet(
                                  product: widget.product,
                                );
                              });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Specifications:',
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(Icons.arrow_right_sharp)
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Delivery',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {}, //address,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          _address ??
                                              'Delivery address not set',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.orange),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.location_pin,
                                        size: 16,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Delivery date/type ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700),
                                ),
                                Text(
                                  'Delivery charge: ${widget.product!.isShippingChargeable == true ? 'Rs: ${widget.product!.shippingCharge}' : 'Free'}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Rating & reviews (5)'),
                          Text('View all'),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviewer Name - Date of review',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'Comments for reviews,\n sdvusdhvuhsduvsd nsicias\n sfascasfasfccas',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviewer Name - Date of review',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'Comments for reviews, sdvusdhvuhsduvsd nsicias\n sfascasfasfccas',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviewer Name - Date of review',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'Comments for reviews, sdvusdhvuhsduvsd nsicias sfascasfasfccas gogogogogogogogogogogogogogogog dkadkandandqndiqwnd jsnfjansicnaiosfncajncljka ajnfnacnwincw ncinicneincewvlweknlvia',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviewer Name - Date of review',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'AAAAAComments for reviews, sdvusdhvuhsduvsd nsicias sfascasfasfccas gogogogogogogogogogogogogogogog dkadkandandqndiqwnd jsnfjansicnaiosfncajncljka ajnfnacnwincw ncinicneincewvlweknlvia',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviewer Name - Date of review',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'Comments for reviews, sdvusdhvuhsduvsd nsicias sfascasfasfccas gogogogogogogogogogogogogogogog dkadkandandqndiqwnd jsnfjansicnaiosfncajncljka ajnfnacnwincw ncinicneincewvlweknlvia',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviewer Name - Date of review',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'Comments for reviews,\n sdvusdhvuhsduvsd nsicias\n sfascasfasfccas',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey))),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.store_outlined,
                  ),
                  Text('Store'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalDivider(
                  color: Colors.grey.shade400,
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Icon(Icons.chat),
                  Text('Chat'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalDivider(
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigo.shade400),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Buy now",
                  )),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo.shade100)),
                  onPressed: () {},
                  child: const Text("Add to cart")),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
