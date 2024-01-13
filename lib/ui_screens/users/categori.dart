import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/admin/ctrl.dart';

class CategoriX extends StatelessWidget {
  const CategoriX({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                  // color: Colors
                  borderRadius: BorderRadius.circular(20)),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ],
        ));
  }
}
