import 'package:flutter/material.dart';

void main() {
  runApp(const PahimakasApp());
}

class PahimakasApp extends StatelessWidget {
  const PahimakasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class GoogleFonts {
  static latoTextTheme() {}

  static lato({required int fontSize, Color? color, required FontWeight fontWeight}) {}
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SafeArea(
        child: Column(
          children: [
            // Animated Logo Section
            Expanded(
              flex: 2,
              child: Center(
                child: ScaleTransition(
                  scale: _animation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'logo.png', 
                        height: 120,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'PAHIMAKAS',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Buttons Section
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAnimatedButton(
                      context,
                      Icons.assignment,
                      'Service Arrangements',
                      Colors.green,
                    ),
                    _buildAnimatedButton(
                      context,
                      Icons.person,
                      'On-Call Personnel',
                      Colors.green[700]!,
                    ),
                    _buildAnimatedButton(
                      context,
                      Icons.phone_in_talk,
                      'Messages/Monitoring',
                      Colors.lightGreen,
                    ),
                    _buildAnimatedButton(
                      context,
                      Icons.contact_page,
                      'Contact Us',
                      Colors.greenAccent,
                    ),
                  ],
                ),
              ),
            ),

            // Footer Section
            Container(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.search, color: Colors.white),
                  Icon(Icons.person, color: Colors.white),
                  Icon(Icons.shopping_cart, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context, IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label pressed'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 2),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}