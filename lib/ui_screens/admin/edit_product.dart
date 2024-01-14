import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latihan/ui_screens/admin/admin_data.dart';

class EditProduct extends StatefulWidget {
  final String? initialData; // Optional parameter for initial data
  const EditProduct({Key? key, this.initialData}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _warnaController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // If initialData is provided, populate the text fields with existing data
    if (widget.initialData != null) {
      _namaController.text = "Existing Name";
      _warnaController.text = "Existing Color";
      _modelController.text = "Existing Model";
      _hargaController.text = "Existing Price";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _modelController,
              decoration: const InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: _warnaController,
              decoration: const InputDecoration(labelText: 'Warna'),
            ),
            TextField(
              controller: _hargaController,
              decoration: const InputDecoration(labelText: 'Harga'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _submitData();
              },
              child: Text(widget.initialData != null ? 'Update' : 'Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() {}
}
