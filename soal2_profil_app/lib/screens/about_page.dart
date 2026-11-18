import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
    const AboutPage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
           appBar:  AppBar(
            title: const Text('Tentang Saya'),
            ),
            body: ListView(
                padding: const EdgeInsets.all(20),
                children: const[
                    ListTile(
                        leading: Icon(Icons.school),
                        title: Text('Pendidikan'),
                        subtitle: Text('Global Institute'),
                    ),
                    
                    ListTile(
                        leading: Icon(Icons.book),
                        title: Text('hobi'),
                        subtitle: Text('Membaca'),
                    ),
                    ListTile(
                        leading: Icon(Icons.favorite),
                        title: Text('Minat'),
                        subtitle: Text('Mendegarkan Musik'),
                    ),
                ],
            ),
            );
    }
}