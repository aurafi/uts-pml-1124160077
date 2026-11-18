import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profil data;

  const EditProfilePage({
    super.key,
    required this.data,
  });

  @override
  State<EditProfilePage> createState() {
    return EditProfilePageState();
  }
}

class EditProfilePageState extends
State<EditProfilePage> {
  final nama = TextEditingController();
  final email = TextEditingController();
  final hp = TextEditingController();

  @override
  void initState() {
    super.initState();

    nama.text = widget.data.nama;
    email.text = widget.data.email;
    hp.text = widget.data.hp;
  }

  void simpan() {
    if (nama.text.isEmpty  || 
    !email.text.contains('@') ||
    !RegExp(r'^[0-9]{10,13}$').hasMatch(hp.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Periksa kembali data!')),
      );
      return;
    }
    Navigator.pop(
      context,
      Profil(
        nama: nama.text, 
        nim: widget.data.nim, 
        prodi: widget.data.prodi, 
        kelas: widget.data.kelas, 
        email: email.text, 
        hp: hp.text, 
        github: widget.data.github, 
        bio: widget.data.bio,
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
            controller: nama,
            decoration: const
            InputDecoration(labelText: 'nama'),
            ),
            TextField(
              controller: email,
              decoration: const
              InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: hp,
              keyboardType: TextInputType.phone,
              decoration: const
              InputDecoration(labelText: 'Nomor HP'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: simpan,
               child: const Text('simpan'),
               ),
          ],
        ),
      ),
    );
  }
  }
  
