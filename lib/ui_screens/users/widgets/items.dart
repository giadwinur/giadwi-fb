import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/admin/ctrl_input.dart';
import 'package:latihan/ui_screens/admin/widgets/admin_detail.dart';

class ItemX extends StatelessWidget {
  final String id;

  const ItemX({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDoc(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else if (!snapshot.hasData) {
          return const Text('Data not found');
        }

        final data = snapshot.data;

        if (data == null) {
          return const Text('Data is null');
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          // padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          // width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '-30%',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminDetail(id: id),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.network(
                          '${data['image_url']}',
                          // Menyesuaikan gambar ke dalam ukuran yang diberikan
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'nama : ${data['nama']}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'warna : ${data['warna']}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'harga : RP ${data['harga'].toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
