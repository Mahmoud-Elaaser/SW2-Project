import 'dart:developer';
import 'dart:typed_data';

import 'package:e_markting/features/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo {
  late Database myObjectDB;
  Future<void> initDB() async {
    myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/productDB.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE product (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT NOT NULL,
             description TEXT, 
             image BLOB,
             quantity INTEGER,
             availableQuantity INTEGER,
             favorite INTEGER,
             cart INTEGER
              )''');
      },
    );
  }

  Future<List<ProductModel>> fetchProducts() async {
    log((await myObjectDB.getVersion()).toString());
    return (await myObjectDB.query('product'))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchFavoriteProducts() async {
    return (await myObjectDB
            .query('product', where: 'favorite=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> fetchCartProducts() async {
    return (await myObjectDB.query('product', where: 'cart=?', whereArgs: [1]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<void> insertProduct(String name, String desc, int quantity,
      int availableQuantity, Uint8List image) async {
    await myObjectDB.insert('product', {
      'name': name,
      'description': desc,
      'quantity': quantity,
      'availableQuantity': availableQuantity,
      'image': image,
      'favorite': 0,
      'cart': 0,
    });
  }

  void newQuantity(int qnt, int id) {
    myObjectDB.update(
        'product',
        {
          'availableQuantity': qnt,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  int? quntity = 0;
  void updateCart(int value, int id,  quntity) {
    myObjectDB.update(
        'product',
        {
          'cart': value,
          if (value == 0)
            'availableQuantity': quntity + 1
          else
            'availableQuantity': quntity - 1,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  Future<void> updateFavorite(int value, int id) async {
    await myObjectDB.update(
        'product',
        {
          'favorite': value,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  void deleteProduct(int id) {
    myObjectDB.delete('product', where: 'id=?', whereArgs: [id]);
  }
}
