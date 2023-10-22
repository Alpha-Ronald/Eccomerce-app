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
      name: 'Champion',
      imageUrl:
          'https://images.unsplash.com/photo-1588099768550-4014589e03e0?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D',
      price: 55.5),
  Product(
      id: 2,
      name: 'Stark',
      imageUrl: 'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg',
      price: 65.5),
  Product(
      id: 3,
      name: 'Stone',
      imageUrl:
          'https://i.insider.com/59b7f9d638d20d1f008b4c6f?width=1200&format=jpeg',
      price: 65.5),
  Product(
      id: 4,
      name: 'Supra',
      imageUrl:
          'https://images.unsplash.com/photo-1579338559194-a162d19bf842?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      price: 65.5),
  Product(
      id: 5,
      name: 'Storm',
      imageUrl: 'https://static-uc.olist.ng/upload/20200613/y9kzb0afu2p.jpg',
      price: 65.5),
  Product(
      id: 6,
      name: 'Rike',
      imageUrl:
          'https://fancysoles.com.ng/wp-content/uploads/2023/06/8be8e466775e87c83e5133450c47092a.jpg',
      price: 65.5),
  Product(
      id: 7,
      name: 'Vane',
      imageUrl:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c25lYWtlcnN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
      price: 65.5),
];
