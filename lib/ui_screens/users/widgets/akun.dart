import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/login.dart';

class Akun extends StatelessWidget {
  const Akun({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) => Column(
                children: [
                  // snapshot.hasData
                  //     ? Column(
                  //         children: [
                  //           Text(snapshot.data!.uid),
                  //           Text(snapshot.data!.isAnonymous
                  //               ? 'signin by anonim'
                  //               : 'signin by email ${snapshot.data!.email}'),
                  //           // Text(snapshot.data!.uid),
                  //         ],
                  //       )
                  //     : const Text('anda belum login'),
                  // const SizedBox(height: 10),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: snapshot.data == null
                            ? null
                            : () async {
                                await FirebaseAuth.instance.signOut();
                              },
                        child: const Text(
                          "SignOut",
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: snapshot.data == null
                            ? null
                            : () async {
                                await FirebaseAuth.instance.currentUser!.delete();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                        child: const Text("Delete Account"),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
