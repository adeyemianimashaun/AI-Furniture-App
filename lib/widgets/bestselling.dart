class Bestsellings {
  final String name;
  final String image;
  final double price;
  final String rating;
  final String description;
  final String reviews;
  int quantity;

  Bestsellings({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    required this.reviews,
    required this.quantity,
  });
}

final List<Bestsellings>bestsellers=[
  Bestsellings( name: 'Austrian Table',
    image: 'lib/images/ch1.jpg',
    price: 190.99,
    rating: '4.6',
    description: 'Minimal wooden Chair with luxury finish.',
    reviews:'2',
    quantity:1),
  Bestsellings(name: 'White Gdansk chair',
    image: 'lib/images/ch4.jpg',
    price: 190.99,
    rating: '4.6',
    description: 'Minimal wooden chair with luxury finish.',
    reviews:'2',
     quantity:1),
  Bestsellings(name: 'Wood Coffee Table',
    image: 'lib/images/t2.jpg',
    price: 190.99,
    rating: '4.6',
    description: 'Minimal wooden Chair with luxury finish.',
    reviews:'2',
     quantity:1),
  Bestsellings(name: 'Wood Luxury Bed',
    image: 'lib/images/b3.jpg',
    price: 99.99,
    rating: '4.6',
    description: 'Minimal wooden bed with luxury finish.',
    reviews:'2',
     quantity:1),
  Bestsellings(name: 'Irish Lamp',
    image: 'lib/images/l3.jpg',
    price: 88.99,
    rating: '4.6',
    description: 'Minimal wooden lamp with luxury finish.',
    reviews:'2',
     quantity:1),
  Bestsellings(name: 'Warsaw Lamp',
    image: 'lib/images/l8.jpg',
    price: 88.99,
    rating: '4.6',
    description: 'Minimal wooden lamp with luxury finish.',
    reviews:'2',
     quantity:1),
  Bestsellings(name: 'Italian Wooden Table',
    image: 'lib/images/t4.jpg',
    price: 88.99,
    rating: '4.6',
    description: 'Minimal wooden table with luxury finish.',
    reviews:'2',
     quantity:1),
    
  ];