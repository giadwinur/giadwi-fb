import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan/models/admin.dart';
import 'package:latihan/ui_screens/admin/admin_data.dart';
import 'package:latihan/ui_screens/admin/ctrl.dart';
import 'package:latihan/ui_screens/admin/ctrl_input.dart';
import 'package:latihan/ui_screens/admin/data.dart';

class AdminInput extends StatefulWidget {
  const AdminInput({super.key});

  @override
  State<AdminInput> createState() => _AdminInputState();
}

class _AdminInputState extends State<AdminInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Input Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pickedImage == null
                  ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'no image',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network('${pickedImage?.path}'),
                    ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                  setState(() {});
                  // debugPrint(pickedImage.toString());
                  // debugPrint(pickedImage!.name);
                  // debugPrint(pickedImage.mimeType);
                  // debugPrint(pickedImage.path);
                },
                child: const Text(
                  "get image",
                ),
              ),
              const SizedBox(height: 10),
              // pickedImage == null ? const SizedBox.shrink() : Text('${pickedImage?.path}', textAlign: TextAlign.center),
              // pickedImage == null
              //     ? const SizedBox.shrink()
              //     : SizedBox(
              //         height: 100,
              //         width: 100,
              //         child: Image.network('${pickedImage?.path}'),
              //       ),
              // const SizedBox(height: 10),
              // FutureBuilder(
              //   future: imageUpload == null ? Future.delayed(Duration.zero) : upload(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const CircularProgressIndicator();
              //     }
              //     return ElevatedButton(
              //       onPressed: () async {
              //         imageUpload = pickedImage;
              //         await upload();
              //         setState(() {});
              //       },
              //       child: Text(
              //         isLoading ? 'loading..' : "upload",
              //       ),
              //     );
              //   },
              // ),
              // Text(imageUrl),
              // imageUrl.isEmpty
              //     ? const SizedBox.shrink()
              //     : SizedBox(
              //         height: 100,
              //         width: 100,
              //         child: Image.network(imageUrl),
              //       ),
              // const SizedBox(height: 10),
              TextField(
                controller: ctrlNama,
                onChanged: (value) {
                  setState(() {
                    isShowClearA = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'nama',
                  suffixIcon: isShowClearA
                      ? IconButton(
                          onPressed: () {
                            ctrlNama.clear();
                            setState(() {
                              isShowClearA = false;
                            });
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ctrlWarna,
                onChanged: (value) {
                  setState(() {
                    isShowClearB = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'warna',
                  suffixIcon: isShowClearB
                      ? IconButton(
                          onPressed: () {
                            ctrlWarna.clear();
                            setState(() {
                              isShowClearB = false;
                            });
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ctrlHarga,
                onChanged: (value) {
                  setState(() {
                    isShowClearC = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'harga',
                  suffixIcon: isShowClearC
                      ? IconButton(
                          onPressed: () {
                            ctrlHarga.clear();
                            setState(() {
                              isShowClearC = false;
                            });
                          },
                          icon: const Icon(Icons.clear),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final id = UniqueKey().toString();
                      final valImage = await upload(id);
                      final valNama = ctrlNama.text;
                      final valWarna = ctrlWarna.text;
                      final valHarga = int.parse(ctrlHarga.text);
                      final newUser = AdminX(
                        id: id,
                        nama: valNama,
                        warna: valWarna,
                        imageUrl: valImage,
                        harga: valHarga,
                      );
                      setState(() {
                        isLoading = true;
                      });
                      await create(newUser);
                      setState(() {
                        isLoading = false;
                      });
                      ctrlNama.clear();
                      ctrlWarna.clear();
                      ctrlHarga.clear();
                      Navigator.pop(context);
                    },
                    child: Text(isLoading ? 'Loading ..' : 'Submit'),
                  )
                ],
              ),

              // Text(imageUrl),
              // imageUrl.isEmpty
              //     ? const SizedBox.shrink()
              //     : SizedBox(
              //         height: 100,
              //         width: 100,
              //         child: Image.network(imageUrl),
              //       )
            ],
          ),
        ));
  }
}
