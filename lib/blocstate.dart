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
  late final List<Product> cartItem;

  //CartState({this.cartItem = const []});

  List<Object> get props => [];
}

class ProductAdded extends CartState {
  final List<Product> cartItem;

  ProductAdded({required this.cartItem});

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded {todos: $cartItem}';
}

class ProductRemoved extends CartState {
  final List<Product> cartItem;

  ProductRemoved({required this.cartItem});

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}

//CART BLOC
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(ProductAdded(cartItem: []));

  final List<Product> cartItems = [];

  List<Product> get items => cartItems;

  @override
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

//had to downgrade the dependency to futer boc7.0.0

//i'd create a new branch and try and make the code work for flutter bloc 8.1.3

/*class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<AddProduct>(onItemAdded);
  }

  final List<Product> cartItems = [];

  List<Product> get items => cartItems;

  Future<void> onProductAdded(
      AddProduct event, Emitter<CartState> emit) async* {
    cartItems.add(event.productIndex);
    emit(ProductAdded(cartItem: List.from(cartItems)));

    void onProductRemoved(RemoveProduct event, Emitter<CartState> emit) {
      cartItems.remove(event.productIndex);
      emit(ProductRemoved(cartItem: List.from(cartItems)));
    }
  }
}*/
