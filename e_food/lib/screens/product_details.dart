import 'package:e_food/entity/app_state.dart';
import 'package:e_food/entity/product.dart';
import 'package:e_food/theme/images.dart';
import 'package:e_food/theme/colors.dart';
import 'package:e_food/util/messages.dart';
import 'package:e_food/widgets/button.dart';
import 'package:e_food/widgets/number_input.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qnt = 1;

  @override
  void initState() {
    super.initState();
  }

  void addBasket() {
    for (var i = 0; i < qnt; i++) {
      // Provider.of<AppState>(context, listen: false).addProduct(widget.product);
      context.read<AppState>().addProduct(widget.product);
    }
    Message.showMessage(context, 'Produto adicionado na cesta.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'DETALHES',
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.product.img,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 36,
                          ),
                        ),
                        Image.asset(AppImages.clock, width: 30),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.subtitle,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: AppColors.secondary),
                        ),
                        Text(
                          '${widget.product.time} min',
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: AppColors.secondary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'DESCRIÇÃO',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.product.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: AppColors.gray,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NumberInput(
                          onValueChanged: (value) {
                            setState(() {
                              qnt = value;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'SUB TOTAL',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              NumberFormat.simpleCurrency(locale: 'pt_BR')
                                  .format(qnt * widget.product.price),
                              style: const TextStyle(
                                fontSize: 24,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Button(
                      label: 'ADICIONAR NA CESTA',
                      onPressed: addBasket,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
