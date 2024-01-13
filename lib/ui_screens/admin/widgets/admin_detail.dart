import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/admin/ctrl_input.dart';

class AdminDetail extends StatelessWidget {
  const AdminDetail({
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
                    SizedBox(width: 100, height: 100, child: Image.network('${snapshot.data!['image_url']}')),
                    const SizedBox(height: 10),
                    // Text('id : ${snapshot.data!['id']}'),
                    Text('nama : ${snapshot.data!['nama']}'),
                    Text('warna : ${snapshot.data!['warna']}'),
                    Text('harga : RP ${snapshot.data!['harga'].toString()}'),
                    // Text('stok : ${snapshot.data!['stok'].toString()}'),
                    // Text('tanggal pembuatan : ${snapshot.data!['created_at'].toString()}'),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
