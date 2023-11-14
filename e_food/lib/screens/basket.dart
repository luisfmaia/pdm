import 'package:e_food/entity/app_state.dart';
import 'package:e_food/entity/product.dart';
import 'package:e_food/screens/sign_in.dart';
import 'package:e_food/theme/colors.dart';
import 'package:e_food/util/authentication.dart';
import 'package:e_food/util/messages.dart';
import 'package:e_food/widgets/button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Basket extends StatefulWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  String calculateTotal() {
    double totalPrice = 0;
    for (var product in context.read<AppState>().basket) {
      totalPrice += product.price;
    }
    return NumberFormat.simpleCurrency(locale: 'pt_BR').format(totalPrice);
  }

  void removeProduct(pos) {
    context.read<AppState>().removeProduct(pos);

    Message.showError(context, 'Produto removido da cesta.');
  }

  Future removeDialog(BuildContext context, pos) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Remover'),
        content: const Text('Deseja remover o produto da cesta?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              removeProduct(pos);
              Navigator.pop(context);
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderProduct(Product product, int pos) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 50,
                height: 50,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: product.img,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(color: AppColors.primary),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              product.name,
              style: const TextStyle(fontSize: 25),
            ),
          ]),
          Row(children: [
            Text(
              product.priceLabel(),
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 40,
              height: 40,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: IconButton(
                    onPressed: () => removeDialog(context, pos),
                    color: AppColors.white,
                    icon: const Icon(Icons.remove)),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'CESTA DE COMPRAS',
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'PEDIDO',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  Expanded(
                    child: (appState.basket.isEmpty)
                        ? const Center(
                            child: Text(
                            'Nenhum produto adicionado na cesta.',
                            style: TextStyle(fontSize: 19),
                          ))
                        : ListView.builder(
                            itemCount: appState.basket.length,
                            itemBuilder: (BuildContext context, int i) {
                              return renderProduct(appState.basket[i], i);
                            }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TOTAL',
                        style: TextStyle(fontSize: 36),
                      ),
                      Text(
                        calculateTotal(),
                        style: const TextStyle(
                            fontSize: 36, color: AppColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Button(
                    label: (appState.basket.isEmpty)
                        ? 'VOLTAR'
                        : 'FINALIZAR COMPRA',
                    onPressed: () async {
                      if (appState.basket.isEmpty) {
                        Navigator.pop(context);
                      } else {
                        await Authentication.signOut(context: context);
                        if (!context.mounted) return;
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
