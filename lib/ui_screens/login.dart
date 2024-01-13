import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/admin/widgets/admin_view.dart';
import 'package:latihan/ui_screens/users/widgets/coba.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login By:'),
              ElevatedButton(
                onPressed: () async {
                  // Navigator.push(context, route)
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AdminView();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Page Admin",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signInAnonymously();
                  // Navigator.push(context, route)
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Coba();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Login Anonim",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
                  await FirebaseAuth.instance.signInWithPopup(provider);
                },
                child: const Text(
                  "Login by Google",
                ),
              ),
            ],
          ),
        ));
  }
}
