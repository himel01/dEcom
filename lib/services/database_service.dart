import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import '../models/model_product.dart';

class DatabaseService {
  static late Database database;

  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    // final int id;
    // final String title;
    // final double price;
    // final String description;
    // final String category;
    // final String image;
    // final Rating rating;

    database =await openDatabase(
      join(path, 'product_database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Products(id INTEGER PRIMARY KEY ,title TEXT ,price DOUBLE ,description TEXT ,category TEXT ,image TEXT ,rating TEXT)",
        );
        await database.execute(
          "CREATE TABLE Cart(id INTEGER PRIMARY KEY ,title TEXT ,price DOUBLE ,description TEXT ,category TEXT ,image TEXT ,rating TEXT)",
        );
      },
      version: 1,
    );
    return database;
  }

  static Future<void> insertProduct(ProductModel product) async {
    final db = await database;
     await db.insert(
      'Products',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  static Future<void> insertCart(ProductModel product) async {
    final db = await database;
    await db.insert(
      'Cart',
      product.toJson(),
      //conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  static Future<List<ProductModel>> products() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Products');

    return List.generate(maps.length, (i) {
      return ProductModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        image: maps[i]['image'],
        rating: Rating.fromJson(json.decode(maps[i]['rating'])),
      );
    });
  }

  static Future<List<ProductModel>> cart() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Cart');

    return List.generate(maps.length, (i) {
      return ProductModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        price: maps[i]['price'],
        description: maps[i]['description'],
        category: maps[i]['category'],
        image: maps[i]['image'],
        rating: Rating.fromJson(json.decode(maps[i]['rating'])),
      );
    });
  }

  static Future<void> deleteProduct(int id,String table) async {
    final db = await database;
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
