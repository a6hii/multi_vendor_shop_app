import 'package:flutter/material.dart';
import 'package:multi_vendor_shop_app/models/category_model.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:multi_vendor_shop_app/screens/main_screen.dart';
import 'package:multi_vendor_shop_app/widgets/home_product_list.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<String> categoryLabels = <String>[
    'Picked for you',
    'Birthdays',
    "Restaurants",
    'Cafes',
    'Resorts',
    'banquet halls'
  ];

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Products for you',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FirestoreListView<Category>(
                      scrollDirection: Axis.horizontal,
                      query: categoryCollection,
                      itemBuilder: (context, snapshot) {
                        Category category = snapshot.data();
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: ActionChip(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            backgroundColor:
                                _selectedCategory == category.catName
                                    ? Colors.green
                                    : Colors.grey,
                            label: Text(
                              category.catName,
                              style: TextStyle(
                                fontSize: 12,
                                color: _selectedCategory == category.catName
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedCategory = category.catName;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.grey.shade500))),
                    child: IconButton(
                      onPressed: () {
                        //show all category list
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const MainScreen(
                              index: 1,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Products list
          HomeProductList(
            category: _selectedCategory,
          ),
        ],
      ),
    );
  }
}
