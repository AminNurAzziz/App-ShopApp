import 'package:flutter/material.dart';
import 'package:shopapp/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: Color.fromARGB(255, 255, 208, 0),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            prefixIconColor: Colors.grey,
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              fontSize: 30.0,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          useMaterial3: true,
        ),
        home: Provider(
            create: (context) => 'Hello Wrrr orld', child: const HomePage()),
      ),
    );
  }
}
