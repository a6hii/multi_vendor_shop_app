import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:multi_vendor_shop_app/firebase_services/firebase_service.dart';
import 'package:multi_vendor_shop_app/widgets/banner_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BrandHighlights extends StatefulWidget {
  const BrandHighlights({Key? key}) : super(key: key);

  @override
  State<BrandHighlights> createState() => _BrandHighlightsState();
}

class _BrandHighlightsState extends State<BrandHighlights> {
  int _pages = 0;
  final FirebaseService _service = FirebaseService();
  final List _brandAds = [];
  @override
  void initState() {
    getBrandAd();
    super.initState();
  }

  getBrandAd() {
    return _service.brandAd.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          _brandAds.add(doc);
        });
      }
    });
  }

  // final List<Widget> page = [
  //   Row(
  //     children: [
  //       Expanded(
  //           flex: 5,
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 4.0),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(4.0),
  //                   child: Container(
  //                     height: 100,
  //                     color: Colors.lightGreen,
  //                     child: const Center(
  //                       child: Text(
  //                         'Ad',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       )),
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ))
  //                 ],
  //               )
  //             ],
  //           )),
  //       Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(0, 0, 8, 20),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(4.0),
  //               child: Container(
  //                 height: 150,
  //                 color: Colors.lightGreen,
  //                 child: const Center(
  //                   child: Text(
  //                     'Ad',
  //                     textAlign: TextAlign.center,
  //                     style:
  //                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ))
  //     ],
  //   ),
  //   Row(
  //     children: [
  //       Expanded(
  //           flex: 5,
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 4.0),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(4.0),
  //                   child: Container(
  //                     height: 100,
  //                     color: Colors.lightGreen,
  //                     child: const Center(
  //                       child: Text(
  //                         'Ad',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       )),
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ))
  //                 ],
  //               ),
  //             ],
  //           )),
  //       Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(0, 0, 8, 20),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(4.0),
  //               child: Container(
  //                 height: 150,
  //                 color: Colors.lightGreen,
  //                 child: const Center(
  //                   child: Text(
  //                     'Ad',
  //                     textAlign: TextAlign.center,
  //                     style:
  //                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ))
  //     ],
  //   ),
  //   Row(
  //     children: [
  //       Expanded(
  //           flex: 5,
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 4.0),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(4.0),
  //                   child: Container(
  //                     height: 100,
  //                     color: Colors.lightGreen,
  //                     child: const Center(
  //                       child: Text(
  //                         'Ad',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       )),
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ))
  //                 ],
  //               ),
  //             ],
  //           )),
  //       Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(0, 0, 8, 20),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(4.0),
  //               child: Container(
  //                 height: 150,
  //                 color: Colors.lightGreen,
  //                 child: const Center(
  //                   child: Text(
  //                     'Ad',
  //                     textAlign: TextAlign.center,
  //                     style:
  //                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ))
  //     ],
  //   ),
  //   Row(
  //     children: [
  //       Expanded(
  //           flex: 5,
  //           child: Column(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 4.0),
  //                 child: ClipRRect(
  //                   borderRadius: BorderRadius.circular(4.0),
  //                   child: Container(
  //                     height: 100,
  //                     color: Colors.lightGreen,
  //                     child: const Center(
  //                       child: Text(
  //                         'Ad',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                             fontSize: 20, fontWeight: FontWeight.bold),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       )),
  //                   Expanded(
  //                       flex: 1,
  //                       child: Padding(
  //                         padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
  //                         child: ClipRRect(
  //                           borderRadius: BorderRadius.circular(4.0),
  //                           child: Container(
  //                             height: 45,
  //                             color: Colors.yellow,
  //                             child: const Center(
  //                               child: Text(
  //                                 'Ad',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     fontSize: 20,
  //                                     fontWeight: FontWeight.bold),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ))
  //                 ],
  //               )
  //             ],
  //           )),
  //       Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding: const EdgeInsets.fromLTRB(0, 0, 8, 20),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(4.0),
  //               child: Container(
  //                 height: 150,
  //                 color: Colors.lightGreen,
  //                 child: const Center(
  //                   child: Text(
  //                     'Ad',
  //                     textAlign: TextAlign.center,
  //                     style:
  //                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ))
  //     ],
  //   ),
  // ];

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Brand highlights',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: _brandAds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8.0, 0, 8, 4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Container(
                                      height: 100,
                                      color: Colors.lightGreen,
                                      // child: YoutubePlayer(
                                      //     controller: YoutubePlayerController(
                                      //   initialVideoId: _brandAds[index]
                                      //       ['youtube'],
                                      //   flags: const YoutubePlayerFlags(
                                      //     autoPlay: false,
                                      //     controlsVisibleAtStart: true,
                                      //     mute: false,
                                      //     loop: true,
                                      //     disableDragSeek: true,
                                      //   ),
                                      // )),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 4, 8),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Container(
                                              height: 45,
                                              child: CachedNetworkImage(
                                                imageUrl: _brandAds[index]
                                                    ['image1'],
                                                fit: BoxFit.fill,
                                                placeholder: (context, url) =>
                                                    GFShimmer(
                                                  showShimmerEffect: true,
                                                  mainColor:
                                                      Colors.grey.shade500,
                                                  secondaryColor:
                                                      Colors.grey.shade300,
                                                  child: Container(
                                                    height: 45,
                                                    color: Colors.grey.shade100,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              4, 0, 8, 8),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            child: Container(
                                              height: 45,
                                              child: CachedNetworkImage(
                                                imageUrl: _brandAds[index]
                                                    ['image2'],
                                                fit: BoxFit.fill,
                                                placeholder: (context, url) =>
                                                    GFShimmer(
                                                  showShimmerEffect: true,
                                                  mainColor:
                                                      Colors.grey.shade500,
                                                  secondaryColor:
                                                      Colors.grey.shade300,
                                                  child: Container(
                                                    height: 45,
                                                    color: Colors.grey.shade100,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Container(
                                  height: 150,
                                  child: CachedNetworkImage(
                                    imageUrl: _brandAds[index]['image3'],
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => GFShimmer(
                                      showShimmerEffect: true,
                                      mainColor: Colors.grey.shade500,
                                      secondaryColor: Colors.grey.shade300,
                                      child: Container(
                                        height: 45,
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    );
                  },
                  controller: _controller, //for dot indicators
                  onPageChanged: ((val) {
                    setState(() {
                      _pages = val;
                    });
                  }),
                ),
                _brandAds.isEmpty == true
                    ? Container()
                    : Positioned.fill(
                        bottom: 6,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DotsIndicatorWidget(
                                    pages: _pages, count: _brandAds.length)
                              ]),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
