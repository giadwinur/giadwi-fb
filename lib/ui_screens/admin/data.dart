import 'package:flutter/material.dart';
import 'package:latihan/models/admin.dart';

final ctrlNama = TextEditingController();
final ctrlWarna = TextEditingController();
final ctrlHarga = TextEditingController();
var isLoading = false;
var isShowClearA = false;
var isShowClearB = false;
var isShowClearC = false;
List<AdminX> userList = [];
var isEnd = false;
// final limit = 3;
var selectedId = '';
// bool allDataLoaded = false;
