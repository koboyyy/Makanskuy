// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Memperbaiki data agar konsisten dan sesuai dengan sumber gambar, nama, dan harga
    final favoriteItems = [
      {
        'title': 'Indomie Goreng Spesial',
        'description': 'Indomie Goreng Spesial dengan telur dan sambal spesial',
        'price': 50000,
        'imageUrl': 'assets/images/foods/indomie_goreng.jpg',
      },
      {
        'title': 'Indomie Ayam Spesial',
        'description': 'Indomie Kuah dengan ayam spesial',
        'price': 50000,
        'imageUrl': 'assets/images/foods/indomie_ayam_spesial.jpeg',
      },
      {
        'title': 'Nasi Goreng Spesial',
        'description': 'Nasi goreng dengan seafood dan telur',
        'price': 45000,
        'imageUrl': 'assets/images/foods/nasi_goreng_spesial.jpg',
      },
      {
        'title': 'Mie Ayam Bakso',
        'description': 'Mie ayam dengan bakso spesial',
        'price': 40000,
        'imageUrl': 'assets/images/foods/mie_ayam_bakso.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Menu Favorit')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return _buildFavoriteItem(
            item['title'] as String,
            item['description'] as String,
            item['price'] as int,
            item['imageUrl'] as String,
          );
        },
      ),
    );
  }

  Widget _buildFavoriteItem(
    String title,
    String description,
    int price,
    String imageUrl,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // Format harga ke currency string dengan titik sebagai pemisah ribuan
                      'Rp. ${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite, color: Colors.red),
                          iconSize: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart),
                          iconSize: 20,
                          color: const Color(0xFF2196F3),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
