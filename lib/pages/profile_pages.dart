import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage:
                  AssetImage('assets/yuni.jpg'), // Pastikan gambar ada
            ),
            const SizedBox(height: 10),
            itemProfile(context, 'Nama Lengkap', 'Yuni Wiji Astuti',
                CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile(context, 'NIM', '212225004', CupertinoIcons.cube_box),
            const SizedBox(height: 10),
            itemProfile(context, 'Program Studi', 'Informatika',
                CupertinoIcons.command),
            const SizedBox(height: 10),
            itemProfile(context, 'Fakultas', 'Matematika Dan Ilmu Komputer',
                CupertinoIcons.command),
            const SizedBox(height: 10),
            itemProfile(context, 'Alamat', 'Banjarsari-Nusawungu-Cilacap',
                CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(context, 'Email', 'yuniwiji2@gmail.com',
                CupertinoIcons.mail),
          ],
        ),
      ),
    );
  }

  Widget itemProfile(
      BuildContext context, String title, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 30, color: Colors.black),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
