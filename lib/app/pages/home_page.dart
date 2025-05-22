import 'package:flutter/material.dart';

import 'package:eclipse/app/services/storage_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final storage = StorageService();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(child: Text('Welcome'),),
        );
    }
}


