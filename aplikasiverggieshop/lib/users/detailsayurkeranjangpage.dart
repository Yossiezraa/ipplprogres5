import 'package:aplikasiverggieshop/users/keranjangpage.dart';
import 'package:flutter/material.dart';

class DetailSayurKeranjangPage extends StatefulWidget {
  final CartItem cartItem;

  DetailSayurKeranjangPage({required this.cartItem});

  @override
  _DetailSayurKeranjangPageState createState() =>
      _DetailSayurKeranjangPageState();
}

class _DetailSayurKeranjangPageState extends State<DetailSayurKeranjangPage> {
  String selectedPaymentMethod = 'transfer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Keranjang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.cartItem.imageUrl),
            SizedBox(height: 20.0),
            Text('Nama: ${widget.cartItem.name}'),
            Text('Harga: ${widget.cartItem.price}'),
            Text('Jumlah: ${widget.cartItem.quantity}'),
            SizedBox(height: 5.0),
            Text('Metode Pembayaran:'),
            RadioListTile(
              title: Text('Transfer'),
              value: 'transfer',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text('Bayar di Tempat (COD)'),
              value: 'COD',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value.toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
