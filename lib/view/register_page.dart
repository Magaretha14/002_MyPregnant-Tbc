import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mypregnant/controller/auth_controller.dart';
import 'package:mypregnant/model/user_model.dart';
import 'package:mypregnant/view/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  /// Kode ini adalah konstruktor untuk kelas RegisterPage.
  /// Namun, tampaknya ada kesalahan sintaks dalam penggunaan "super.key".
  /// Seharusnya menggunakan "Key key" sebagai parameter konstruktor.

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  /// Ini adalah metode yang mendeklarasikan State yang terkait dengan RegisterPage.
  /// Ini akan digunakan untuk mengelola keadaan widget ini.
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  /// Membuat kunci global untuk Form.

  bool _obscurePassword = true;

  /// Variabel boolean untuk mengatur apakah password tersembunyi.

  final FocusNode _focusNodeEmail = FocusNode();

  /// Node fokus untuk alamat email.
  final FocusNode _focusNodePassword = FocusNode();

  /// Node fokus untuk password.
  final FocusNode _focusNodeConfirmPassword = FocusNode();

  /// Node fokus untuk konfirmasi password.

  final TextEditingController _controllerUsername = TextEditingController();

  /// Controller untuk input username.
  final TextEditingController _controllerEmail = TextEditingController();

  /// Controller untuk input email.
  final TextEditingController _controllerPassword = TextEditingController();

  /// Controller untuk input password.

  final authctrl = AuthController();

  /// Membuat instance AuthController.

  String? name;

  /// Variabel untuk menyimpan nama.
  String? email;

  /// Variabel untuk menyimpan alamat email.
  String? password;

  /// Variabel untuk menyimpan password.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,

      /// Mengatur warna latar belakang.
      body: SafeArea(
        child: Form(
          key: _formKey,

          /// Menghubungkan kunci global ke Form.
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),

            /// Padding horizontal untuk konten.
            child: Column(
              children: [
                Image.asset(
                  'images/logomypreg.png',

                  /// Menampilkan gambar dengan path tertentu.
                  height: 200,
                  width: 150,
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create your account",
                  style: TextStyle(color: Colors.purple, fontSize: 15),
                ),
                const SizedBox(height: 35),
                TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onEditingComplete: () => _focusNodeEmail.requestFocus(),
                  onChanged: (value) {
                    name = value;

                    /// Mengisi variabel "name" dengan nilai dari input username.
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerEmail,
                  focusNode: _focusNodeEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onEditingComplete: () => _focusNodePassword.requestFocus(),
                  onChanged: (value) {
                    email = value;

                    /// Mengisi variabel "email" dengan nilai dari input email.
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerPassword,
                  obscureText: _obscurePassword,
                  focusNode: _focusNodePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;

                            /// Mengganti status tersembunyi password.
                          });
                        },
                        icon: _obscurePassword
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onEditingComplete: () =>
                      _focusNodeConfirmPassword.requestFocus(),
                  onChanged: (value) {
                    password = value;

                    /// Mengisi variabel "password" dengan nilai dari input password.
                  },
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          /// Validasi formulir berhasil.
                          UserModel? registeredUser =
                              await authctrl.registerWithEmailAndPassword(
                                  email!, password!, name!);

                          /// Mencoba mendaftarkan pengguna.

                          if (registeredUser != null) {
                            /// Pendaftaran berhasil.
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Registration Successful'),
                                  content: const Text(
                                      'You have been successfully registered.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        print(registeredUser.name);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginPage();
                                        }));

                                        /// Beralih ke halaman login atau lakukan tindakan yang diinginkan.
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            /// Pendaftaran gagal.
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Registration Failed'),
                                  content: const Text(
                                      'An error occurred during registration.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: const Text("Register"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Login"),
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
