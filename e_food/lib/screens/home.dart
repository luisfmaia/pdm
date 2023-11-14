import 'package:e_food/entity/product.dart';
import 'package:e_food/screens/basket.dart';
import 'package:e_food/theme/images.dart';
import 'package:e_food/theme/colors.dart';
import 'package:e_food/util/database.dart';
import 'package:e_food/widgets/product_preview.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [];
  final searchController = TextEditingController();
  String searchStr = '';

  @override
  void initState() {
    super.initState();
    loadProducts().then((result) {
      setState(() {
        products = result;
      });
    }).catchError((onError) {
      setState(() {
        products = [];
      });
    });
  }

  Widget renderProducts() {
    if (products.isEmpty) {
      return const Center(
          child: CircularProgressIndicator(color: AppColors.primary));
    } else {
      List<Product> filtered = products
          .where((p) => p.name.toLowerCase().contains(searchStr.toLowerCase()))
          .toList();

      return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.71,
          children: List.generate(filtered.length, (index) {
            return Center(child: ProductPreview(filtered[index]));
          }),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Text(
                  'BUSCA',
                  key: Key('search'),
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      key: const Key('search_field'),
                      controller: searchController,
                      onChanged: (text) {
                        setState(() {
                          searchStr = searchController.text;
                        });
                      },
                      textAlignVertical: TextAlignVertical.top,
                      style: const TextStyle(fontFamily: 'Poppins'),
                      decoration: const InputDecoration(
                        constraints: BoxConstraints.tightFor(height: 40),
                        filled: true,
                        fillColor: AppColors.grayLight,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(color: AppColors.grayLight),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    iconSize: 45,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Basket(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      AppImages.basket,
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
                child: Text(
                  'RESULTADOS',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              renderProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
