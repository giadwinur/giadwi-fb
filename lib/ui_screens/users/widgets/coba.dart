import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latihan/ui_screens/admin/widgets/admin_view.dart';
import 'package:latihan/ui_screens/users/categori.dart';
// import 'package:latihan/ui_screens/categori.dart';
import 'package:latihan/ui_screens/users/shop.dart';
import 'package:latihan/ui_screens/users/widgets/home_coba.dart';
import 'package:latihan/ui_screens/users/widgets/items.dart';
import 'package:latihan/ui_screens/users/widgets/person.dart';
// import 'package:latihan/ui_screens/items.dart';

class Coba extends StatefulWidget {
  const Coba({super.key});

  @override
  State<Coba> createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  final List<String> daftarProdukId = [
    '[#08b18]',
    '[#090ed]',
    '[#0f64f]',
    '[#31d42]',
    '[#3db5b]',
    '[#a3a4c]',
    '[#1636f]',
    '[#eea55]'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeCoba(),
          Container(
            // height: 500,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 113, 112, 110),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'search here..',
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.search)
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: const Text(
                    'category',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 113, 112, 110),
                    ),
                  ),
                ),
                const CategoriX(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: const Text(
                    'Best Selling',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 113, 112, 110),
                    ),
                  ),
                ),

                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: daftarProdukId.length,
                //   itemBuilder: (context, index) {
                //     return ItemX(id: daftarProdukId[index]);
                //   },
                // )
                for (String productId in daftarProdukId) ItemX(id: productId),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Coba()),
                );
              },
              child: const Badge(
                padding: EdgeInsets.all(7),
                backgroundColor: Colors.red,
                child: Icon(Icons.home, size: 30, color: Colors.purpleAccent),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopX()),
                );
              },
              child: const Badge(
                padding: EdgeInsets.all(7),
                backgroundColor: Colors.red,
                child: Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.purpleAccent),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminView()),
                );
              },
              child: const Badge(
                padding: EdgeInsets.all(7),
                backgroundColor: Colors.red,
                child: Icon(Icons.assignment_ind_outlined, size: 30, color: Colors.purpleAccent),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IconAkun()),
                );
              },
              child: const Badge(
                padding: EdgeInsets.all(7),
                backgroundColor: Colors.red,
                child: Icon(Icons.person, size: 30, color: Colors.purpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
