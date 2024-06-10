import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:basic_ecoomerce_app/Cubit/cart_cubit.dart';
import 'package:basic_ecoomerce_app/Screens/AddToCart.dart';
import 'package:basic_ecoomerce_app/Screens/Model/Product%20Model.dart';
import 'package:basic_ecoomerce_app/Screens/Model/cartModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> product = [
    ProductModel(
      id: 1,
      price: 899,
      name: 'Asics',
      pic:
          'https://plus.unsplash.com/premium_photo-1663100769321-9eb8fe5a8e6b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
    ),
    ProductModel(
      id: 2,
      price: 1899,
      name: 'Nike',
      pic:
          'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
    ),
    ProductModel(
      id: 3,
      name: 'Reebock',
      price: 1299,
      pic:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
    ),
    ProductModel(
      id: 4,
      name: 'Snikker',
      price: 999,
      pic:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
    ),
    ProductModel(
      id: 5,
      name: 'Puma',
      price: 2899,
      pic:
          'https://images.unsplash.com/photo-1575537302964-96cd47c06b1b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNob2VzfGVufDB8fDB8fHww',
    ),
    ProductModel(
      id: 6,
      name: 'Bacabucci',
      price: 799,
      pic:
          'https://images.unsplash.com/photo-1587563871167-1ee9c731aefb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHNob2VzfGVufDB8fDB8fHww',
    ),
    ProductModel(
      id: 7,
      name: 'Addidas',
      price: 899,
      pic:
          'https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHNob2VzfGVufDB8fDB8fHww',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Footware Company',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              icon: Icon(Icons.shopping_cart)),
        ),
        body: ListView.builder(
            itemCount: product.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image(
                              image: CachedNetworkImageProvider(
                                  product[index].pic)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                product[index].name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Price- ${product[index].price}/-",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                snack_bar(context, 'congrats',
                                    'Your product added', ContentType.success);
                                context
                                    .read<CartCubit>()
                                    .addTocart(product: product[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen()));
                              },
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.white,
                    )
                  ],
                ),
              );
            }));
  }

  static snack_bar(
      BuildContext context, String title, message, ContentType contentType) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }



}
