import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/admin/ctrl_input.dart';

class DeatilUser extends StatelessWidget {
  const DeatilUser({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: FutureBuilder(
        future: getDoc(id),
        builder: (context, snapshot) => snapshot.hasData
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network('${snapshot.data!['image_url']}'),
                    ),
                    const SizedBox(height: 10),
                    Text('nama : ${snapshot.data!['nama']}'),
                    Text('warna : ${snapshot.data!['warna']}'),
                    Text('model : ${snapshot.data!['model']}'),
                    Text('harga : RP ${snapshot.data!['harga'].toString()}'),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
