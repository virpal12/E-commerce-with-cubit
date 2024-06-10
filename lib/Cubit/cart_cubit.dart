import 'package:basic_ecoomerce_app/Screens/Model/Product%20Model.dart';
import 'package:basic_ecoomerce_app/Screens/Model/cartModel.dart';
import 'package:bloc/bloc.dart';

class CartCubit extends Cubit<CartModel> {
  CartCubit() : super(CartModel(product: [], quantity: []));

  addTocart({required ProductModel product}) {
    int index = state.product.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      List<int> quantities = List.from(state.quantity);
      quantities [index]++;
      emit(state.copyWith(quantity: quantities));
    } else {
      emit(state.copyWith(
          product: state.product..add(product),
          quantity: state.quantity..add(1)));
    }
  }
  void increment({required int index}) {
    List<int> quantities = state.quantity;
    quantities[index]++;
     emit(state.copyWith(quantity: quantities));

  }

  void decrement({required int index}) {
    List<int> quantities = state.quantity;
    if (state.quantity[index] > 1) {
      quantities[index]--;

      return emit(state.copyWith(quantity: quantities));
    }

  }

  void removeFromCart({required int index}) {
    List<ProductModel> products = List.from(state.product);
    List<int> quntities = List.from(state.quantity);

    products.removeAt(index);
    quntities.removeAt(index);
    emit(state.copyWith(product: products, quantity: quntities));
  }


}
