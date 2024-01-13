// import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:latihan/models/admin.dart';
import 'package:latihan/ui_screens/admin/admin_data.dart';
import 'package:latihan/ui_screens/admin/ctrl_input.dart';
import 'package:latihan/ui_screens/admin/data.dart';
import 'package:latihan/ui_screens/admin/widgets/admin_detail.dart';
import 'package:latihan/ui_screens/admin/widgets/admin_input.dart';

class AdminView extends StatefulWidget {
  const AdminView({
    super.key,
  });

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  void initState() {
    loadmore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.deepPurple,
          title: const Text('Admin Page'),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AdminInput();
                    },
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  // debugPrint('ini di refresh');
                });
              },
              child: const Icon(Icons.refresh),
            )
          ],
        ),
        body: FutureBuilder(
          future: getColl(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(child: CircularProgressIndicator());
            // }
            // if (snapshot.hasData) {
            //   if (snapshot.data!.isEmpty) {
            //     return const Text('Empty');
            //   }
            // }
            if (snapshot.hasData) {
              final length = userList.length;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //  Image.network('${snapshot.data!['image_url']}')
                    ...List.generate(length, (index) {
                      final data = userList[index];
                      final id = data.id;
                      return Card(
                        child: ListTile(
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  final updateDoc = AdminX(
                                    createdAt: data.createdAt,
                                    id: data.id,
                                    nama: WordPair.random().toString(),
                                    warna: 'light blue',
                                    harga: 100000,
                                  );
                                  update(updateDoc);
                                },
                                icon: const Icon(Icons.update),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await delete(id);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                          leading: Image.network(imageUrl),
                          title: Text(data.nama),
                          subtitle: Text(data.createdAt),
                          selectedTileColor: const Color.fromARGB(255, 5, 15, 51),
                          selected: selectedId == id,
                          onTap: () {
                            setState(() {
                              selectedId = id;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminDetail(
                                  id: id,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    isEnd
                        ? const Center(child: Text('data habis'))
                        : snapshot.connectionState == ConnectionState.waiting
                            ? const CircularProgressIndicator()
                            : OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    loadmore();
                                  });
                                },
                                child: const Text('loadmore'),
                              )
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}


















// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:latihan/ui_screens/admin/ctrl_input.dart';
// import 'package:latihan/ui_screens/admin/data.dart';
// // import 'package:latihan/ui_screens/admin/widgets/admin_detail.dart';
// import 'package:latihan/ui_screens/admin/widgets/admin_input.dart';

// class AdminView extends StatefulWidget {
//   const AdminView({super.key});

//   @override
//   State<AdminView> createState() => _AdminViewState();
// }

// class _AdminViewState extends State<AdminView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Page'),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return const AdminInput();
//                   },
//                 ),
//               );
//             },
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: () {
//               setState(() {});
//             },
//             child: const Icon(Icons.refresh),
//           )
//         ],
//       ),
//       body: FutureBuilder(
//         future: FirebaseStorage.instance.ref().listAll(),
//         // initialData: InitialData,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ...List.generate(
//                     snapshot.data!.items.length,
//                     (index) {
//                       // final id = userList[index].id;
//                       return Card(
//                         child: ListTile(
//                           title: Text(snapshot.data!.items[index].name),
//                           subtitle: Text(snapshot.data!.items[index].fullPath),
//                           // trailing: IconButton(
//                           //   onPressed: () async {
//                           //     final result = await snapshot.data!.items[index].getDownloadURL();
//                           //     debugPrint(result);
//                           //   },
//                           //   icon: const Icon(Icons.download),
//                           // ),
//                           leading: FutureBuilder(
//                             future: snapshot.data!.items[index].getDownloadURL(),
//                             builder: (context, snapshot) {
//                               if (snapshot.hasData) {
//                                 return CircleAvatar(
//                                   backgroundImage: NetworkImage(snapshot.data.toString()),
//                                 );
//                               }

//                               return const Text('text');
//                             },
//                           ),
//                           onTap: () {
//                             setState(() {});
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (context) {
//                             //       return AdminDetail(
//                             //         id: id,
//                             //       );
//                             //     },
//                             //   ),
//                             // );
//                           },
//                         ),
//                       );
//                     },
//                   ),
//                   isEnd
//                       ? const Text('data habis')
//                       : snapshot.connectionState == ConnectionState.waiting
//                           ? const CircularProgressIndicator()
//                           : OutlinedButton(
//                               onPressed: () {
//                                 setState(() {
//                                   loadMore();
//                                 });
//                               },
//                               child: const Text('loadmore'),
//                             )
//                 ],
//               ),
//             );
//           }

//           return const Text('text');
//         },
//       ),
//     );
//   }
// }
