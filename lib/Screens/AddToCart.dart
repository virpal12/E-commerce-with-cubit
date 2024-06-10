import 'package:basic_ecoomerce_app/Screens/Model/cartModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartModel>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add to cart',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: state.product.isEmpty
            ? Center(
                child: Text(
                  'Cart is Empty',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.product.length,
                        itemBuilder: (context, index) {
                          final product = state.product[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 230,
                              child: Row(
                                children: [
                                  Container(
                                    height: 250,
                                    width: 210,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                product.pic),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Price : ${product.price}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Center(
                                              child: IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<CartCubit>()
                                                        .increment(
                                                            index: index);
                                                  },
                                                  icon: Icon(Icons.add)),
                                            ),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black),
                                              color: Colors.orange.shade100,
                                            ),
                                          ),
                                          Container(
                                            child: Center(
                                                child: Text(
                                              state.quantity[index].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )),
                                            height: 35,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Colors.black,
                                                      width: 1),
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 1)),
                                              color: Colors.orange.shade100,
                                            ),
                                          ),
                                          Container(
                                            child: Center(
                                              child: IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<CartCubit>()
                                                        .decrement(
                                                            index: index);
                                                  },
                                                  icon: Icon(Icons.remove)),
                                            ),
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black),
                                              color: Colors.orange.shade100,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<CartCubit>()
                                                .removeFromCart(index: index);
                                          },
                                          icon: Icon(Icons.delete)),
                                      Text(
                                        "Total Price     \n${state.productTotal(index).toString()}/-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.red),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  state.total > 1000
                      ? Column(
                          children: [
                            Text(
                              "Payble Amount : ${state.total.toString()}/-",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20,color: Colors.red.shade900),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              Text(
                                  "Product Amount : ${state.total.toString()} + Dilivery Charge :${120.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              Text("Payble Amount : ${state.total + 120}/-",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.red.shade900)),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
      );
    });
  }

  }


