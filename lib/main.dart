import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:untitled/pages/account_page.dart';
import 'package:untitled/pages/login_page.dart';
import 'package:untitled/pages/splash_page.dart';
import 'package:untitled/utils/constant.dart';

final _supabaseUrl = 'https://vtqsyabnnplpmyqobikw.supabase.co';
final _supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cXN5YWJubnBscG15cW9iaWt3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQwMzM4NjYsImV4cCI6MTk4OTYwOTg2Nn0.Jy5yVeFyNyO39UzA515zTKGyFtOdRkCWw8C2TUDQ3pI";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: _supabaseUrl,
    anonKey: _supabaseKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => const AccountPage(),
      },
    );
  }
}