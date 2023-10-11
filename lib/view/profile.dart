import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypregnant/components/header.dart';
import 'package:mypregnant/components/header_profile.dart';
import 'package:mypregnant/view/login_page.dart';

final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

/// Mendefinisikan koleksi Firestore yang digunakan untuk menyimpan data pengguna.

class Profile extends StatefulWidget {
  const Profile({super.key});

  /// Kode ini adalah konstruktor untuk kelas Profile.
  /// Namun, tampaknya ada kesalahan sintaks dalam penggunaan "super.key".
  /// Seharusnya menggunakan "Key key" sebagai parameter konstruktor.

  @override
  State<Profile> createState() => _ProfileState();

  /// Ini adalah metode yang mendeklarasikan State yang terkait dengan Profile.
  /// Ini akan digunakan untuk mengelola keadaan widget ini.
}

class _ProfileState extends State<Profile> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  /// Mendapatkan instance pengguna saat ini dari FirebaseAuth.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerProfile(context, titleText: 'Profile'),

      /// Menampilkan AppBar dengan fungsi headerProfile.
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,

      /// Mengatur warna latar belakang.

      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: usersCollection.doc(currentUser?.uid).snapshots(),

          /// Menggunakan StreamBuilder untuk mendengarkan perubahan pada dokumen pengguna di Firestore.

          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Terjadi kesalahan: ${snapshot.error}');

              /// Menampilkan pesan kesalahan jika terjadi error.
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();

              /// Menampilkan indikator loading jika data masih dimuat.
            }

            if (snapshot.hasData && snapshot.data!.exists) {
              /// Memeriksa apakah ada data profil dan dokumen pengguna ada.

              final userData = snapshot.data!.data() as Map<String, dynamic>;

              /// Mendapatkan data profil pengguna dari dokumen Firestore.

              final username = userData['name'];
              final email = userData['email'];

              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16.0),

                /// Mengatur padding untuk konten.

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),

                    /// Menampilkan avatar berbentuk lingkaran dengan ikon pengguna.

                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Nama : ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          username,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    /// Menampilkan nama pengguna.

                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Email : ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          email,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    /// Menampilkan alamat email pengguna.
                  ],
                ),
              );
            }

            return Text('Profil tidak ditemukan');

            /// Menampilkan pesan jika profil tidak ditemukan.
          },
        ),
      ),
    );
  }
}
