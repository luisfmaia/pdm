import 'package:e_food/entity/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void saveUser(BuildContext context, User user) async {
  
  DocumentReference userDB =
      FirebaseFirestore.instance.collection('user').doc(user.uid);

  await userDB.get().then((DocumentSnapshot doc) async {
    if (doc.exists) {
      return await userDB.update({
        'name': user.displayName,
        'picture': user.photoURL,
      });
    } else {
      return await userDB.set({
        'name': user.displayName,
        'picture': user.photoURL,
      });
    }
  });
}

Future<List<Product>> loadProducts() async {
  CollectionReference recordsRef =
      FirebaseFirestore.instance.collection('/products/');

  late final List<Product> products;

  await recordsRef.get().then((QuerySnapshot snapshot) {
    products = snapshot.docs
        .map((doc) => Product(
              doc['name'],
              doc['img'],
              doc['price'],
              doc['description'],
              doc['subtitle'],
              doc['time'],
            ))
        .toList();
  });

  return products;
}
