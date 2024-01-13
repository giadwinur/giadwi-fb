import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/admin/widgets/admin_view.dart';
import 'dart:html' as html;

import 'package:latihan/ui_screens/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flawless.co'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  html.window.open('https://github.com/giadwinur/giadwi-fb', 'new tab');
                },
                child: const Text(
                  "Go to Github",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                child: const Text(
                  "get started",
                ),
              ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () async {
              //     await FirebaseAuth.instance.signInAnonymously();
              //     // Navigator.push(context, route)
              //     // ignore: use_build_context_synchronously
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return const AdminView();
              //         },
              //       ),
              //     );
              //   },
              //   child: const Text(
              //     "Login Anonim",
              //   ),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () async {
              //     final provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
              //     await FirebaseAuth.instance.signInWithPopup(provider);
              //   },
              //   child: const Text(
              //     "Login by Google",
              //   ),
              // ),
            ],
          ),
        ));
  }
}
