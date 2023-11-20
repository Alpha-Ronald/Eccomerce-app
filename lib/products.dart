final List<String> productImageUrls = [
  'https://i.insider.com/59b7f9d638d20d1f008b4c6f?width=1200&format=jpeg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAmSEEvhHXDXaviuYSVkcL-rWKFO9-mIpadNaq6nUNPDzitBo901abdbOhEI2VrCw1IsQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYfwkGUk9S7S8SxQGC5FrDkJ8NhdoMb__Ypw&usqp=CAU',
  'https://cdn.dribbble.com/users/5488123/screenshots/14167386/13_dec_carousel_slider_new2.png?resize=320x240&vertical=center',
  'https://d.line-scdn.net/lcp-prod-photo/20210321_212/1616332307098NNCcY_PNG/8B3ATNVBDLWOCS3QAK848PQP5WQ0M1.png?type=f640',
];

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      this.quantity = 0});
}
//final product = products[index];

final List<Product> products = [
  Product(
      id: 1,
      name: 'Kick 1',
      imageUrl:
          'https://images.unsplash.com/photo-1588099768550-4014589e03e0?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D',
      price: 55.5),
  Product(
      id: 2,
      name: 'Kick 2',
      imageUrl:
          'https://images.unsplash.com/photo-1597045566677-8cf032ed6634?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D',
      price: 65.5),
  Product(
      id: 3,
      name: 'Kick 3',
      imageUrl:
          'https://images.unsplash.com/photo-1603787081207-362bcef7c144?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c25lYWtlcnxlbnwwfHwwfHx8MA%3D%3D',
      price: 65.5),
  Product(
      id: 4,
      name: 'Kick 4',
      imageUrl:
          'https://images.unsplash.com/photo-1579338559194-a162d19bf842?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      price: 65.5),
  Product(
      id: 5,
      name: 'Kick 5',
      imageUrl:
          'https://images.unsplash.com/photo-1543508282-6319a3e2621f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D',
      price: 65.5),
  Product(
      id: 6,
      name: 'Kick 6',
      imageUrl:
          'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D',
      price: 65.5),
  Product(
      id: 7,
      name: 'Kick 7',
      imageUrl:
          'https://images.unsplash.com/photo-1581017316471-1f6ef7ce6fd3?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjN8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D',
      price: 65.5),
];
