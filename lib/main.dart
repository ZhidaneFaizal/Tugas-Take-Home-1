import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  int currentPage = 2;

  final List<String> titles = const [
    'Beranda',
    'Kategori',
    'My Cart',
    'My Profile',
  ];

  final List<Widget> pages = const [
    HomePage(),
    CategoryPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          leading: Icon(
            currentPage == 2
                ? Icons.shopping_cart
                : currentPage == 3
                    ? Icons.arrow_back
                    : Icons.menu,
          ),
          title: Text(
            titles[currentPage],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            if (currentPage == 0 || currentPage == 2)
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
          ],
        ),

        body: IndexedStack(
          index: currentPage,
          children: pages,
        ),

        bottomNavigationBar: NavigationBar(
          selectedIndex: currentPage,
          indicatorColor: Colors.blue.shade100,
          onDestinationSelected: (index) {
            setState(() {
              currentPage = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: Icon(Icons.grid_view_outlined),
              selectedIcon: Icon(
                Icons.grid_view,
                color: Colors.blue,
              ),
              label: 'Kategori',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('3'),
                child: Icon(Icons.shopping_cart_outlined),
              ),
              selectedIcon: Badge(
                label: Text('3'),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.blue,
                ),
              ),
              label: 'Keranjang',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Selamat Datang, Zhidane!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Temukan produk yang kamu butuhkan.',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),

          TextField(
            decoration: InputDecoration(
              hintText: 'Cari produk...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            height: 150,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.lightBlueAccent,
                ],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Belanja Mudah\nHarga Bersahabat!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  size: 75,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Produk Populer',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          buildHomeProduct(
            icon: Icons.headphones,
            name: 'Wireless Headphone',
            price: 'Rp 350.000',
          ),
          buildHomeProduct(
            icon: Icons.laptop_mac,
            name: 'Laptop ASUS Vivobook',
            price: 'Rp 7.500.000',
          ),
          buildHomeProduct(
            icon: Icons.mouse,
            name: 'Wireless Mouse',
            price: 'Rp 250.000',
          ),
        ],
      ),
    );
  }

  Widget buildHomeProduct({
    required IconData icon,
    required String name,
    required String price,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          price,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Elektronik',
        'icon': Icons.devices,
        'color': Colors.blue,
      },
      {
        'name': 'Komputer',
        'icon': Icons.computer,
        'color': Colors.purple,
      },
      {
        'name': 'Aksesori',
        'icon': Icons.headphones,
        'color': Colors.orange,
      },
      {
        'name': 'Smartphone',
        'icon': Icons.smartphone,
        'color': Colors.green,
      },
      {
        'name': 'Gaming',
        'icon': Icons.sports_esports,
        'color': Colors.red,
      },
      {
        'name': 'Kamera',
        'icon': Icons.camera_alt,
        'color': Colors.teal,
      },
    ];

    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Kategori ${category['name']} dipilih',
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        (category['color'] as Color).withOpacity(0.12),
                    child: Icon(
                      category['icon'] as IconData,
                      size: 32,
                      color: category['color'] as Color,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    category['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.icon,
    required this.iconColor,
    required this.likes,
    this.quantity = 1,
  });

  final String name;
  final String brand;
  final int price;
  final IconData icon;
  final Color iconColor;

  int likes;
  int quantity;
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int? selectedProductIndex;
  int? plusOneProductIndex;

  final List<Product> products = [
    Product(
      name: 'Wireless Headphone',
      brand: 'Sony WH-CH520',
      price: 350000,
      icon: Icons.headphones,
      iconColor: Colors.grey,
      likes: 12,
    ),
    Product(
      name: 'Laptop ASUS Vivobook',
      brand: 'ASUS',
      price: 7500000,
      icon: Icons.laptop_mac,
      iconColor: Colors.deepPurple,
      likes: 8,
    ),
    Product(
      name: 'Wireless Mouse',
      brand: 'Logitech M330',
      price: 250000,
      icon: Icons.mouse,
      iconColor: Colors.grey,
      likes: 5,
    ),
  ];

  int get totalPrice {
    return products.fold(
      0,
      (total, product) {
        return total + (product.price * product.quantity);
      },
    );
  }

  String formatRupiah(int number) {
    final value = number.toString();
    final result = StringBuffer();

    for (int i = 0; i < value.length; i++) {
      if (i > 0 && (value.length - i) % 3 == 0) {
        result.write('.');
      }
      result.write(value[i]);
    }

    return 'Rp ${result.toString()}';
  }

  // TAP: memilih produk
  void selectProduct(int index) {
    setState(() {
      selectedProductIndex =
          selectedProductIndex == index ? null : index;
    });
  }

  // DOUBLE TAP: menambah like
  void addLike(int index) {
    setState(() {
      products[index].likes++;
      plusOneProductIndex = index;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        if (plusOneProductIndex == index) {
          plusOneProductIndex = null;
        }
      });
    });
  }

  // LONG PRESS: menampilkan pesan
  void showProductMessage(int index) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Produk dipilih! ${products[index].name}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.only(bottom: 12),
            child: const Text(
              'Belanja lebih mudah setiap hari',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                return buildProductCard(index);
              },
            ),
          ),

          buildCheckoutSection(),
        ],
      ),
    );
  }

  Widget buildProductCard(int index) {
    final product = products[index];
    final isSelected = selectedProductIndex == index;
    final showPlusOne = plusOneProductIndex == index;

    return GestureDetector(
      onTap: () {
        selectProduct(index);
      },
      onDoubleTap: () {
        addLike(index);
      },
      onLongPress: () {
        showProductMessage(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.shade50
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Colors.blue
                : Colors.grey.shade200,
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                product.icon,
                size: 54,
                color: product.iconColor,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.brand,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    formatRupiah(product.price),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 19,
                              ),
                              const SizedBox(width: 4),
                              Text('${product.likes}'),
                            ],
                          ),
                          if (showPlusOne)
                            Positioned(
                              top: -22,
                              right: -15,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  '+1',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      const Spacer(),

                      buildQuantityButton(
                        icon: Icons.remove,
                        backgroundColor: Colors.grey.shade200,
                        iconColor: Colors.grey.shade700,
                        onPressed: () {
                          setState(() {
                            if (product.quantity > 1) {
                              product.quantity--;
                            }
                          });
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          '${product.quantity}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      buildQuantityButton(
                        icon: Icons.add,
                        backgroundColor: Colors.blue,
                        iconColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            product.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuantityButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(7),
        child: SizedBox(
          width: 28,
          height: 28,
          child: Icon(
            icon,
            size: 17,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  Widget buildCheckoutSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total (${products.length} produk)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  formatRupiah(totalPrice),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Pesanan menuju proses checkout.',
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int likes = 10;
  bool photoSelected = false;
  bool showPlusOne = false;
  bool nameSelected = false;

  void addProfileLike() {
    setState(() {
      likes++;
      showPlusOne = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        showPlusOne = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            photoSelected = !photoSelected;
                          });
                        },
                        onDoubleTap: addProfileLike,
                        child: AnimatedContainer(
                          duration:
                              const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: photoSelected
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 4,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/IMG_1341.JPG',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey.shade300,
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 80,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          setState(() {
                            nameSelected = !nameSelected;
                          });
                        },
                        child: AnimatedContainer(
                          duration:
                              const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: nameSelected
                                ? Colors.blue.shade50
                                : Colors.transparent,
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Zhidane',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      if (nameSelected)
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'Profil dipilih!',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Zhidan@stu.untar.ac.id',
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 10),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '$likes',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),

                      if (showPlusOne)
                        Positioned(
                          right: -36,
                          top: -6,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),
                            child: const Text(
                              '+1',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Tombol Edit Profile ditekan.',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: buildProfileMenu(
                            icon: Icons.person_outline,
                            label: 'Data Diri',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: buildProfileMenu(
                            icon: Icons.interests_outlined,
                            label: 'Hobi',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: buildProfileMenu(
                            icon: Icons.info_outline,
                            label: 'Tentang Saya',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildProfileMenu({
    required IconData icon,
    required String label,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                child: Icon(icon, color: Colors.blue),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}