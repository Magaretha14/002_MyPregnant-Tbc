import 'package:flutter/material.dart';
import 'package:mypregnant/controller/auth_controller.dart';
import 'package:mypregnant/view/register_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _focusNodePassword = FocusNode();

  final TextEditingController _controllerUsername = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  bool _obscurePassword = true;

  final authctrl = AuthController();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Image.asset(
                  'images/logomypreg.png',
                  height: 200,
                  width: 150,
                ),
                const Text(
                  "Welcome back",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Login to your account",
                  style: TextStyle(color: Colors.purple, fontSize: 15),
                ),
                const SizedBox(height: 60),
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
                  onEditingComplete: () => _focusNodePassword.requestFocus(),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerPassword,
                  focusNode: _focusNodePassword,
                  obscureText: _obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
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
                  onChanged: (valu
                  e) {
                    password = value;

                  },
                ),
                const SizedBox(height: 60),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            _formKey.currentState?.reset();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterPage();
                                },
                              ),
                            );
                          },
                          child: const Text("Signup"),
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
