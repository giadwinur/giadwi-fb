import 'package:firebase_storage/firebase_storage.dart';
import 'package:latihan/ui_screens/admin/admin_data.dart';

Future<String> upload(String id) async {
  final typeFoto = pickedImage?.mimeType;
  final imageBytes = await pickedImage!.readAsBytes();
  final namaFoto = id;
  final metaData = SettableMetadata(contentType: typeFoto);
  final uploadImage = await FirebaseStorage.instance.ref(namaFoto).putData(imageBytes, metaData);
  imageUrl = await uploadImage.ref.getDownloadURL();
  pickedImage = null;
  return imageUrl;
  // return uploadImage.toString();
}
