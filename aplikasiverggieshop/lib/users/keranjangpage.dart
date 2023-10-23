import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeranjangPage(),
    );
  }
}

class KeranjangPage extends StatefulWidget {
  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<CartItem> cartItems = [
    CartItem('Kangkung', 10.000, 2,
        'https://i0.wp.com/umsu.ac.id/berita/wp-content/uploads/2023/07/Kangkung.jpg?fit=1200%2C900&ssl=1'),
    CartItem('Bayam', 15.000, 1,
        'https://i0.wp.com/portalmadura.com/wp-content/uploads/2020/01/sayur-bayam.jpg'),
    CartItem('Bayam', 15.000, 1,
        'https://i0.wp.com/portalmadura.com/wp-content/uploads/2020/01/sayur-bayam.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailBarangPage(cartItem: cartItems[index]),
                  ),
                );
              },
              leading: Image.network(cartItems[index].imageUrl),
              title: Text(cartItems[index].name),
              subtitle: Text(
                'Harga: \$${cartItems[index].price} - Jumlah: ${cartItems[index].quantity}',
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem(this.name, this.price, this.quantity, this.imageUrl);
}

class DetailBarangPage extends StatelessWidget {
  final CartItem cartItem;

  DetailBarangPage({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cartItem.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(cartItem.imageUrl),
            SizedBox(height: 16.0),
            Text('Nama: ${cartItem.name}'),
            Text('Harga: \$${cartItem.price}'),
            Text('Jumlah: ${cartItem.quantity}'),
          ],
        ),
      ),
    );
  }
}
