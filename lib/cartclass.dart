class Cart {
  final List<int> cartItems = [];

  List<int> get items => cartItems;

  void add(int itemNo) {
    cartItems.add(itemNo);
  }

  void remove(int itemNo) {
    cartItems.remove(itemNo);
  }
}
