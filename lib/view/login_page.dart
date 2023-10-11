import 'package:flutter/material.dart';
import 'package:mypregnant/controller/auth_controller.dart';
import 'package:mypregnant/model/user_model.dart';
import 'package:mypregnant/view/homepage.dart';
import 'package:mypregnant/view/register_page.dart';

String userId = "";

/// Mendeklarasikan variabel userId dengan nilai awal kosong.

class LoginPage extends StatefulWidget {
  /// Membuat kelas LoginPage yang merupakan StatefulWidget.
  LoginPage({super.key});

  /// Konstruktor untuk kelas LoginPage.

  @override
  State<LoginPage> createState() => _LoginPageState();

  /// Menerapkan createState() untuk mengembalikan objek _LoginPageState.
}

class _LoginPageState extends State<LoginPage> {
  /// Membuat _LoginPageState yang merupakan State dari LoginPage.
  final _formKey = GlobalKey<FormState>();

  /// Membuat GlobalKey untuk Form.

  final FocusNode _focusNodePassword = FocusNode();

  /// Membuat FocusNode untuk input password.

  final TextEditingController _controllerUsername = TextEditingController();

  /// Membuat TextEditingController untuk input username.

  final TextEditingController _controllerPassword = TextEditingController();

  /// Membuat TextEditingController untuk input password.

  bool _obscurePassword = true;

  /// Variabel untuk mengontrol keberlanjutan password.

  final authctrl = AuthController();

  /// Membuat objek dari kelas AuthController.

  String? email;

  /// Variabel untuk menyimpan nilai dari input email.
  String? password;

  /// Variabel untuk menyimpan nilai dari input password.

  @override
  Widget build(BuildContext context) {
    /// Memulai membangun tampilan widget.
    return Scaffold(
      /// Membuat tampilan scaffold.
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,

      /// Mengatur warna latar belakang sesuai dengan tema.

      body: SafeArea(
        /// Menyediakan area aman untuk konten.
        child: Form(
          /// Membuat Form yang akan digunakan untuk validasi input.
          key: _formKey,

          /// Menggunakan GlobalKey yang sudah dideklarasikan sebelumnya.

          child: SingleChildScrollView(
            /// Menggunakan SingleChildScrollView untuk menghindari overflow jika keyboard muncul.
            padding: const EdgeInsets.all(30.0),

            /// Memberikan padding pada konten.
            child: Column(
              /// Menggunakan kolom untuk menampilkan elemen-elemen UI.
              children: [
                /// Daftar elemen-elemen yang akan ditampilkan.
                Image.asset(
                  /// Menampilkan gambar dari file lokal.
                  'images/logomypreg.png',

                  /// Lokasi file gambar.
                  height: 200,

                  /// Tinggi gambar.
                  width: 150,

                  /// Lebar gambar.
                ),
                const Text(
                  /// Menampilkan teks statis.
                  "Welcome back",

                  /// Teks yang ditampilkan.
                  style: TextStyle(

                      /// Mengatur gaya teks.
                      color: Colors.purple,

                      /// Warna teks.
                      fontSize: 30,

                      /// Ukuran font.
                      fontWeight: FontWeight.bold),

                  /// Ketebalan font.
                ),
                const SizedBox(height: 10),

                /// Spasi kosong vertikal.
                const Text(
                  /// Menampilkan teks statis.
                  "Login to your account", // Teks yang ditampilkan.
                  style: TextStyle(color: Colors.purple, fontSize: 15),

                  /// Mengatur gaya teks.
                ),
                const SizedBox(height: 60),

                /// Spasi kosong vertikal.
                TextFormField(
                  /// Input teks untuk email.
                  controller: _controllerUsername,

                  /// Menggunakan controller yang sudah dideklarasikan.
                  keyboardType: TextInputType.name,

                  /// Jenis keyboard yang digunakan.
                  decoration: InputDecoration(
                    /// Mengatur tampilan input.
                    labelText: "Email",

                    /// Label input.
                    prefixIcon: const Icon(Icons.person_outline),

                    /// Ikon di sebelah kiri input.
                    border: OutlineInputBorder(
                      /// Mengatur border input.
                      borderRadius: BorderRadius.circular(10),

                      /// Mengatur border radius.
                    ),
                    enabledBorder: OutlineInputBorder(
                      /// Mengatur border saat input dalam keadaan aktif.
                      borderRadius: BorderRadius.circular(10),

                      /// Mengatur border radius.
                    ),
                  ),
                  onEditingComplete: () => _focusNodePassword.requestFocus(),

                  /// Fokus ke input password saat selesai mengedit email.
                  onChanged: (value) {
                    /// Callback saat nilai input berubah.
                    email = value;

                    /// Menyimpan nilai email.
                  },
                ),
                const SizedBox(height: 10),

                /// Spasi kosong vertikal.
                TextFormField(
                  /// Input teks untuk password.
                  controller: _controllerPassword,

                  /// Menggunakan controller yang sudah dideklarasikan.
                  focusNode: _focusNodePassword,

                  /// Menggunakan FocusNode yang sudah dideklarasikan.
                  obscureText: _obscurePassword,

                  /// Mengatur apakah teks ditampilkan atau tidak.
                  keyboardType: TextInputType.visiblePassword,

                  /// Jenis keyboard yang digunakan.
                  decoration: InputDecoration(
                    /// Mengatur tampilan input.
                    labelText: "Password",

                    /// Label input.
                    prefixIcon: const Icon(Icons.lock),

                    /// Ikon di sebelah kiri input.
                    suffixIcon: IconButton(

                        /// Ikon di sebelah kanan input (untuk mengubah visibilitas password).
                        onPressed: () {
                          //// Callback saat tombol visibilitas password ditekan.
                          setState(() {
                            /// Memperbarui tampilan dengan setState.
                            _obscurePassword = !_obscurePassword;

                            /// Mengganti visibilitas password.
                          });
                        },
                        icon: _obscurePassword
                            ? const Icon(Icons.visibility_outlined)

                            /// Ikon ketika password tersembunyi.
                            : const Icon(Icons.visibility_off_outlined)),

                    /// Ikon ketika password terlihat.
                    border: OutlineInputBorder(
                      /// Mengatur border input.
                      borderRadius: BorderRadius.circular(10),

                      /// Mengatur border radius.
                    ),
                    enabledBorder: OutlineInputBorder(
                      /// Mengatur border saat input dalam keadaan aktif.
                      borderRadius: BorderRadius.circular(10),

                      /// Mengatur border radius.
                    ),
                  ),
                  onChanged: (value) {
                    /// Callback saat nilai input berubah.
                    password = value;

                    /// Menyimpan nilai password.
                  },
                ),
                const SizedBox(height: 60),

                /// Spasi kosong vertikal.
                Column(
                  /// Kolom untuk menampilkan tombol login dan teks signup.
                  children: [
                    ElevatedButton(
                      /// Tombol untuk melakukan login.
                      style: ElevatedButton.styleFrom(
                        /// Mengatur tampilan tombol.
                        minimumSize: const Size.fromHeight(50),

                        /// Ukuran minimum tombol.
                        shape: RoundedRectangleBorder(
                          /// Mengatur bentuk tombol.
                          borderRadius: BorderRadius.circular(20),

                          /// Mengatur border radius.
                        ),
                      ),
                      onPressed: () async {
                        /// Callback saat tombol login ditekan.
                        if (_formKey.currentState!.validate()) {
                          /// Melakukan validasi form.
                          UserModel? registeredUser = await authctrl
                              .signInWithEmailAndPassword(email!, password!);

                          /// Melakukan login dengan email dan password.

                          userId = registeredUser!.Uid;

                          /// Mengupdate userId dengan UID pengguna yang berhasil login.

                          if (registeredUser != null) {
                            /// Jika login berhasil.
                            showDialog(
                              /// Menampilkan dialog sukses.
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Login Successful'),

                                  /// Judul dialog sukses.
                                  content: const Text(
                                      'You have been successfully login.'),

                                  /// Isi dialog sukses.
                                  actions: <Widget>[
                                    TextButton(
                                      /// Tombol OK di dalam dialog sukses.
                                      onPressed: () {
                                        print(registeredUser.name);

                                        /// Mencetak nama pengguna.
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HomePage();

                                          /// Menavigasi ke halaman beranda.
                                        }));
                                      },
                                      child: const Text('OK'),

                                      /// Teks tombol OK.
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            /// Jika login gagal.
                            showDialog(
                              /// Menampilkan dialog gagal.
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Login Failed'),

                                  /// Judul dialog gagal.
                                  content: const Text(
                                      'An error occurred during login.'),

                                  /// Isi dialog gagal.
                                  actions: <Widget>[
                                    TextButton(
                                      /// Tombol OK di dalam dialog gagal.
                                      onPressed: () {
                                        Navigator.pop(context);

                                        /// Menutup dialog.
                                      },
                                      child: const Text('OK'),

                                      /// Teks tombol OK.
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: const Text("Login"),

                      /// Teks pada tombol login.
                    ),
                    Row(
                      /// Baris untuk teks "Don't have an account?" dan tombol signup.
                      mainAxisAlignment: MainAxisAlignment.center,

                      /// Mengatur posisi teks dan tombol.
                      children: [
                        const Text("Don't have an account?"),

                        /// Teks "Don't have an account?".
                        TextButton(
                          /// Tombol untuk signup.
                          onPressed: () {
                            /// Callback saat tombol signup ditekan.
                            _formKey.currentState?.reset();

                            /// Mengosongkan form.
                            Navigator.push(
                              /// Menavigasi ke halaman pendaftaran (RegisterPage).
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterPage();

                                  /// Halaman pendaftaran.
                                },
                              ),
                            );
                          },
                          child: const Text("Signup"),

                          /// Teks pada tombol signup.
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
