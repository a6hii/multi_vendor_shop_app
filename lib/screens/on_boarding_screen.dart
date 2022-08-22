import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor_shop_app/screens/main_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = 'onboard-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _pages = 0;
  final _controller = PageController();
  final store = GetStorage();

  onButtonPressed(context) {
    store.write('onBoarding', true);
    return Navigator.pushReplacementNamed(context, MainScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            padEnds: false,
            controller: _controller,
            onPageChanged: ((val) {
              setState(() {
                _pages = val.toInt();
              });
            }),
            children: [
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/64.png',
                        fit: BoxFit.fitHeight,
                        //height: double.infinity,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 10),
                      child: Text(
                        'Welcome\nto Fiesto',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44,
                            color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Book restaurants, cafes,\nbanquet halls, marriage halls and more..',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: SvgPicture.asset(
                        'assets/images/64.svg',
                        fit: BoxFit.fitWidth,
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 10, top: 15),
                      child: Text(
                        'Fiesto\nParty Services',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44,
                            color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Get all kinds of party services and\nsolutions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/65.png',
                        fit: BoxFit.cover,
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 10, top: 15),
                      child: Text(
                        'Fiesto\nParty Services',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44,
                            color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Get all kinds of party services and\nsolutions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/66.jpg',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 10),
                      child: Text(
                        'Fiesto\nParty Services',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44,
                            color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Get all kinds of party services and\nsolutions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                boardColumn: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/67.jpg',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, bottom: 10),
                      child: Text(
                        'Fiesto\nParty Services',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 44,
                            color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Get all kinds of party services and\nsolutions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 180,
            //   left: 125,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    //https://pub.dev/smooth_page_indicator
                    activeIndex: _pages,
                    count: 5,
                    effect: const JumpingDotEffect(
                      dotHeight: 16,
                      dotWidth: 16,
                      jumpScale: .7,
                      verticalOffset: 15,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 120,
            child: TextButton(
              child: const Text(
                'Skip & Proceed to\nLogin/Signup',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 13, 13),
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                onButtonPressed(context);
              },
            ),
          ),
          Positioned(
            right: 16,
            bottom: 50,
            width: 150,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_pages == 0) {
                  _controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else if (_pages == 1) {
                  _controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else if (_pages == 2) {
                  _controller.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else if (_pages == 3) {
                  _controller.animateToPage(
                    4,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                } else if (_pages == 4) {
                  onButtonPressed(context);
                }

                // if (_controller.hasClients) {
                //   _controller.animateToPage(
                //     index,
                //     duration: const Duration(milliseconds: 400),
                //     curve: Curves.easeInOut,
                //   );
                //}
              },
              child: _pages <= 3
                  ? const Text(
                      'Next',
                      style: TextStyle(fontSize: 22),
                    )
                  : const Text(
                      'Login/Signup',
                      style: TextStyle(fontSize: 22),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? boardColumn;

  const OnBoardPage({Key? key, this.boardColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 0, 0),
      child: boardColumn,
    );
  }
}
