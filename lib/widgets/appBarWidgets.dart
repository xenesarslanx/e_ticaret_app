import 'package:flutter/material.dart';

AppBar appBarMethod(BuildContext context, Widget text, onpressedFav, onpressedCart) {
    return AppBar(
      title: text,
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
             Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => onpressedFav),
);
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_basket_sharp),
          onPressed: () {
             Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => onpressedCart),
);
          },
        ),
      ],
    );
  }