import 'package:flutter/material.dart';
import 'package:untitled/utils/constant.dart';

class SimpleAppPage extends StatefulWidget {
  const SimpleAppPage({Key? key}) : super(key: key);

  @override
  _SimpleAppPageState createState() => _SimpleAppPageState();
}

class _SimpleAppPageState extends State<SimpleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  supabase.auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                icon: const Icon(Icons.logout));
          },
        ),
      ),
    );
  }
}
