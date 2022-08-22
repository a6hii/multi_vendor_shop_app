import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:multi_vendor_shop_app/firebase_services/firebase_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseService _service = FirebaseService();
  int _pages = 0;
  //int c = 0;
  List bannerImages = [];

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  getBanners() {
    return _service.homeBanner.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          bannerImages.add(doc['image']);
        });
      }
    });
  }

  final _controller = PageController();
  //final store = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: Colors.grey.shade200,
              height: 140,
              width: MediaQuery.of(context).size.width,
              //color: Colors.white,

              child: PageView.builder(
                itemCount: bannerImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: bannerImages[index],
                    placeholder: (context, url) => GFShimmer(
                        showShimmerEffect: true,
                        mainColor: Colors.grey.shade500,
                        secondaryColor: Colors.grey.shade300,
                        child: Container(
                          color: Colors.grey.shade200,
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                        )),
                  );
                },
                controller: _controller,
                onPageChanged: ((val) {
                  setState(() {
                    _pages = val.toInt();
                  });
                }),
              ),
            ),
          ),
        ),
        bannerImages.isEmpty == true
            ? Container()
            : Positioned.fill(
                bottom: 18,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DotsIndicatorWidget(
                          pages: _pages, count: bannerImages.length),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    Key? key,
    required int pages,
    count,
  })  : _pages = pages,
        c = count,
        super(key: key);

  final int _pages;
  final int c;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: _pages,
      count: c,
      effect: const WormEffect(
          spacing: 4.0,
          activeDotColor: Colors.green,
          dotColor: Colors.grey,
          dotHeight: 8.0,
          dotWidth: 8.0,
          radius: 3,
          type: WormType.normal),
    );
  }
}
