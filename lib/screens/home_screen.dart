import 'package:flutter/material.dart';
import 'package:multi_vendor_shop_app/widgets/brand_highlights.dart';
import 'package:multi_vendor_shop_app/widgets/banner_widget.dart';
import 'package:multi_vendor_shop_app/widgets/category/category_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Fiesto',
              style: TextStyle(letterSpacing: 2),
            ),
            elevation: 2,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ),
        body: ListView(
          children: const [
            SearchWidget(),
            SizedBox(
              height: 10,
            ),
            BannerWidget(),
            BrandHighlights(),
            CategoryWidget(),
          ],
        ));
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const TextField(
                  decoration: InputDecoration(
                filled: false,
                //fillColor: Colors.white, // use when filled is true
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 12, 8, 0),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Icon(
                    Icons.search,
                    size: 22,
                    //color: Colors.grey,
                  ),
                ),
              )),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 18,
                  ),
                  Text(
                    '100% Verified',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 18,
                  ),
                  Text(
                    '1 day confirmation',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 18,
                  ),
                  Text(
                    'Trusted partners',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
