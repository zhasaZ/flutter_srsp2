import 'package:flutter/material.dart';

import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  BoxFit _currentFit = BoxFit.cover;
  bool _showFirstImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Официальная Страничка')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Демонстрация Luton Town',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DropdownButton<BoxFit>(
              value: _currentFit,
              items: const [
                DropdownMenuItem(value: BoxFit.cover, child: Text('BoxFit.cover')),
                DropdownMenuItem(value: BoxFit.fitWidth, child: Text('BoxFit.fitWidth')),
                DropdownMenuItem(value: BoxFit.fitHeight, child: Text('BoxFit.fitHeight')),
              ],
              onChanged: (value) {
                setState(() {
                  _currentFit = value!;
                });
              },
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: Image.asset(
                'assets/image1.png',
                fit: _currentFit,
                // BoxFit.cover      — заполняет весь контейнер, обрезая лишнее
                // BoxFit.fitWidth   — подгоняет по ширине
                // BoxFit.fitHeight  — подгоняет по высоте
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    _showFirstImage ? 'assets/image1.png' : 'assets/image2.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  const Center(
                    child: Text(
                      'Welcome to Luton Town',
                      style: TextStyle(
                        color: Color.fromARGB(255, 136, 100, 52),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Это SnackBar!')),
                  );
                },
                child: const Text('Show SnackBar', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text('Go to Second Screen', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 200,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    _showFirstImage = !_showFirstImage;
                  });
                },
                child: const Text('Toggle Image', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}






