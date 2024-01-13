import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/admin/data.dart';
import 'package:latihan/ui_screens/admin/widgets/admin_view.dart';
import 'package:latihan/ui_screens/users/shop.dart';
import 'package:latihan/ui_screens/users/widgets/akun.dart';

class HomeCoba extends StatefulWidget {
  const HomeCoba({super.key});

  @override
  State<HomeCoba> createState() => _HomeCobaState();
}

class _HomeCobaState extends State<HomeCoba> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                // selectedId = id;
              });
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Flawless.co',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Badge(
            padding: const EdgeInsets.all(7),
            backgroundColor: Colors.red,
            child: InkWell(
              onTap: () {
                setState(() {
                  // selectedId = id;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Akun()),
                );
              },
              child: const Icon(Icons.person, size: 30, color: Colors.purpleAccent),
            ),
          )
        ],
      ),
    );
  }
}
