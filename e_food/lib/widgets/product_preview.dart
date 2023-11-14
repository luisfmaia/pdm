import 'package:e_food/entity/app_state.dart';
import 'package:e_food/entity/product.dart';
import 'package:e_food/screens/product_details.dart';
import 'package:e_food/theme/colors.dart';
import 'package:e_food/theme/images.dart';
import 'package:e_food/util/messages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPreview extends StatelessWidget {
  final Product product;

  const ProductPreview(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(product),
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        color: AppColors.white,
        shadowColor: AppColors.black,
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 170,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: product.img,
                  placeholder: (context, url) => const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primary)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    product.priceLabel(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<AppState>().addProduct(product);
                    Message.showMessage(
                        context, 'Produto adicionado na cesta.');
                  },
                  icon: Image.asset(AppImages.basket),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
