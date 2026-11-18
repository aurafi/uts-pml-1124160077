import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
    final VoidCallback ubahTema;

    const ProfilePage({
        super.key, 
        required this.ubahTema,
    });

    @override
    State<ProfilePage> createState() {
        return ProfilePageState();
    }
}

class ProfilePageState extends State<ProfilePage> {
  String? foto;

  Future<void> pilihFoto() async {
    final ImagePicker picker = ImagePicker();

    final XFile? hasil = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (hasil != null) {
      setState(() {
        foto = hasil.path;
      });
    }
  }
    Profil mahasiswa = const Profil(
        nama: 'Aurafi Farida',
        nim: '1124160077',
        prodi: 'Teknik Informatika',
        kelas: 'Ti 24 Sh',
        email: '1124160077@global.ac.id',
        hp: '085692619457',
        github: 'github.com/aurafi',
        bio: 'mahasiswa teknik informatika',
    );

    void simpanProfil(Profil data) {
        setState(() {
            mahasiswa = data;
        });
    }

    @override 
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Profil Mahasiswa'),
                actions: [
                    IconButton(
                        onPressed: widget.ubahTema,
                        icon: const Icon(Icons.dark_mode),
                    ),
                ],
            ),
            body: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: foto != null ? NetworkImage(foto!) :
                      null,
                      child: foto == null
                      ? const Icon(Icons.person, size: 60)
                      : null,
                    ),
                    ElevatedButton(
                      onPressed: pilihFoto, 
                      child: const Text('Ganti Foto'),
                      ),

                    const SizedBox(height: 15),

                    Center(
                        child: Text(
                            mahasiswa.nama,
                            style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),

                    Center(child: Text(mahasiswa.prodi)),

                    const SizedBox(height: 20),

                    InfoTile(
                        icon: Icons.badge,
                        label: 'NIM',
                        value: mahasiswa.nim,
                    ),

                    InfoTile(
                        icon: Icons.school,
                        label: 'Kelas',
                        value: mahasiswa.kelas,
                    ),

                    InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: mahasiswa.email,
                    ),

                    InfoTile(
                        icon: Icons.phone,
                        label: 'WhatsApp',
                        value: mahasiswa.hp,
                    ),

                    InfoTile(
                        icon: Icons.code,
                        label: 'Github',
                        value: mahasiswa.github,
                    ),

                    InfoTile(
                        icon: Icons.person,
                        label: 'Bio',
                        value: mahasiswa.bio,
                    ),

                    const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () async {
              final hasil = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditProfilePage(data: mahasiswa);
                  },
                ),
              );

              if (hasil != null) {
                simpanProfil(hasil);
              }
            },
            child: const Text('Edit Profil'),
          ),

          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AboutPage();
                  },
                ),
              );
            },
            child: const Text('Tentang Saya'),
          ),
                ],
            ),
        );
    }
}       