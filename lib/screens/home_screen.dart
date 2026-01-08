import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'history_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';
import '../widgets/food_card.dart';
import '../models/food_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<FoodItem> foodItems = [
    FoodItem(
      id: '1',
      name: 'Indomie Goreng Spesial',
      description: 'Indomie Goreng Spesial dengan telur dan sambal spesial',
      price: 50000,
      imageUrl: 'assets/images/foods/indomie_goreng.jpg',
    ),
    FoodItem(
      id: '2',
      name: 'Indomie Ayam Spesial',
      description: 'Indomie Kuah dengan ayam spesial',
      price: 50000,
      imageUrl: 'assets/images/foods/indomie_ayam_spesial.jpeg',
    ),
    FoodItem(
      id: '3',
      name: 'Nasi Goreng Spesial',
      description: 'Nasi goreng dengan seafood dan telur',
      price: 45000,
      imageUrl: 'assets/images/foods/nasi_goreng_spesial.jpg',
    ),
    FoodItem(
      id: '4',
      name: 'Mie Ayam Bakso',
      description: 'Mie ayam dengan bakso spesial',
      price: 40000,
      imageUrl: 'assets/images/foods/mie_ayam_bakso.jpg',
    ),
  ];

  List<Widget> get _widgetOptions => <Widget>[
    HomeContent(foodItems: foodItems),
    const HistoryScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makanskuy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<FoodItem> foodItems;

  const HomeContent({super.key, required this.foodItems});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cari Lauk untuk Makananmu!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Lauk...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Makanan Populer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: foodItems.length, // 🔥 DINAMIS
              itemBuilder: (context, index) {
                final food = foodItems[index];

                return FoodCard(
                  name: food.name,
                  price: food.price,
                  imageUrl: food.imageUrl,
                  onTap: () {
                    // TODO: navigasi ke detail
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
