import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = [
      {
        "title": "Smart Watch",
        "image": "../assets/images/smartwatch.png", // Corrected image path
      },
      {
        "title": "Headphones",
        "image": "../assets/images/earbuds.jpg", // Corrected image path
      },
      {
        "title": "Iphone 16",
        "image": "../assets/images/iphone16.png", // Corrected image path
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Custom height
        child: ClipPath(
          clipper: CurvedAppBarClipper(),
          child: AppBar(
            title: const Text('GookWay'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Action for search icon
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Action for shopping cart icon
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () {
                  // Action for user profile icon
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('GookWay Shop', style: TextStyle(color: Colors.white)),
              accountEmail: const Text('shop@gookway.com', style: TextStyle(color: Colors.white)),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.shopping_bag, color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
  
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Categories"),
              onTap: () {
                // Navigate to categories page
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text("Profile"),
              onTap: () {
                // Navigate to profile page
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Cart"),
              onTap: () {
                // Navigate to shopping cart page
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                // Perform log out action
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Popular Picks 🔥",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9, // Adjusted for better image visibility
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  // Action when a product is tapped
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image Container
                      Flexible(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            product["image"]!,
                            fit: BoxFit.cover, // Ensures the image fits the space
                          ),
                        ),
                      ),
                      // Text Container
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          product["title"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CurvedAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30); // Create curve at the bottom
    path.quadraticBezierTo(
      size.width / 3, size.height, // Adjust this value for different curvature
      size.width, size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
