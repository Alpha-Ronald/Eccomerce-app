import 'package:equatable/equatable.dart';
import 'package:flutter_projects/landing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//CART EVENT

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddProduct extends CartEvent {
  final Product productIndex;

  AddProduct(this.productIndex);

  @override
  List<Object> get props => [productIndex];

  @override
  String toString() => 'AddProduct {index: $productIndex}';
}

class RemoveProduct extends CartEvent {
  final Product productIndex;

  RemoveProduct(this.productIndex);

  @override
  List<Object> get props => [productIndex];

  @override
  String toString() => 'RemoveProduct {index: $productIndex}';
}

//Class State

abstract class CartState {
  /* final List<Product> cartItem;
  CartState({this.cartItem = const[
  ]});
  @override
  List<Object> get props => [];*/
}

class ProductAdded extends CartState {
  final List<Product> cartItem;

  ProductAdded({required this.cartItem});

  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded {todos: $cartItem}';
}

class ProductRemoved extends CartState {
  final List<Product> cartItem;

  ProductRemoved({required this.cartItem});

  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}

//CART BLOC
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(ProductAdded(cartItem: []));

  final List<Product> cartItems = [];

  List<Product> get items => cartItems;

  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProduct) {
      cartItems.add(event.productIndex);
      yield ProductAdded(cartItem: cartItems);
    } else if (event is RemoveProduct) {
      cartItems.remove(event.productIndex);
      yield ProductRemoved(cartItem: cartItems);
    }
  }
}
