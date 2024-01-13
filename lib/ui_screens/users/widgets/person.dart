import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IconAkun extends StatelessWidget {
  const IconAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) => Column(
                children: [
                  snapshot.hasData
                      ? Column(
                          children: [
                            Text(snapshot.data!.uid),
                            Text(snapshot.data!.isAnonymous
                                ? 'signin by anonim'
                                : 'signin by email ${snapshot.data!.email}'),
                            // Text(snapshot.data!.uid),
                          ],
                        )
                      : const Text('anda belum login'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
