import 'package:flutter/material.dart';

void main () {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        useMaterial3: true,
      ),
      home: const ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFF15345B),
            child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 15),
            const Text('Aurafi Farida',
            style: TextStyle(fontSize: 23,
            fontWeight: FontWeight.bold)),
            const Text('Teknik Informatika'),
            const Text('Nim: 1124160077'),

            const SizedBox(height: 20),
            const Text('Informasi Kontak',
            style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold)),

            const InfoTile(Icons.phone, 'WhatsApp',
            '089678908897'),
            const InfoTile(Icons.email, 'Email', '1124160077@global.ac.id'),
            const InfoTile(Icons.camera_alt, 'Instagram', '@aura'),

            const SizedBox(height: 15),
            const Text('Hobi',
            style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold)),

            const InfoTile(Icons.book, 'Hobi', 'Membaca Novel'),
        ],
      
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Terima Kasih!')),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoTile(this.icon, this.title, this.subtitle,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}