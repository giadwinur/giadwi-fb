import 'dart:convert';

class AdminX {
  final String id;
  final String nama;
  final String warna;
  final String model;
  final String createdAt;
  final String imageUrl;
  final int harga;
  AdminX({
    this.nama = '',
    this.warna = '',
    this.model = '',
    this.id = '',
    this.createdAt = '',
    this.imageUrl = '',
    this.harga = 0,
  });

  AdminX copyWith({
    String? nama,
    String? warna,
    String? model,
    String? id,
    String? createdAt,
    String? imageUrl,
    int? harga,
  }) {
    return AdminX(
      nama: nama ?? this.nama,
      warna: warna ?? this.warna,
      model: model ?? this.model,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
      harga: harga ?? this.harga,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nama': nama});
    result.addAll({'warna': warna});
    result.addAll({'model': model});
    result.addAll({'id': id});
    result.addAll({'created_at': createdAt});
    result.addAll({'image_url': imageUrl});
    result.addAll({'harga': harga});

    return result;
  }

  factory AdminX.fromMap(Map<String, dynamic> map) {
    return AdminX(
      nama: map['nama'] ?? '',
      warna: map['warna'] ?? '',
      model: map['model'] ?? '',
      id: map['id'] ?? '',
      createdAt: map['created_at'] ?? '',
      imageUrl: map['image_url'] ?? '',
      harga: map['harga']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminX.fromJson(String source) => AdminX.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminX(nama: $nama, warna: $warna, model: $model, id: $id, createdAt: $createdAt, imageUrl: $imageUrl, harga: $harga)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdminX &&
        other.nama == nama &&
        other.warna == warna &&
        other.model == model &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.imageUrl == imageUrl &&
        other.harga == harga;
  }

  @override
  int get hashCode {
    return nama.hashCode ^
        warna.hashCode ^
        model.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        imageUrl.hashCode ^
        harga.hashCode;
  }
}
