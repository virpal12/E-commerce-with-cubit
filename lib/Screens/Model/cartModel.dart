import 'Product Model.dart';

class CartModel {
  List<ProductModel> product;
  List<int> quantity;

  CartModel({required this.product, required this.quantity});

  CartModel copyWith({
    List<ProductModel>? product,
    List<int>? quantity,
  }) {
    return CartModel(
        product: product ?? this.product, quantity: quantity ?? this.quantity);
  }

  int get total {
    int total = 0;
    for (int i = 0; i < product.length; i++) {
      total = total + (product[i].price * quantity[i]);
    }
    return total;
  }

  int productTotal(int index) {
    return product[index].price * quantity[index];
  }
}
