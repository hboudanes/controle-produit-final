import 'package:dosage/model/produitfini.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  createDatabase() async {
    try {
      if (_db != null) {
        return _db;
      }
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      // join('path', 'to', 'foo'); // -> 'path/to/foo' selon paltorme
      String path = join(await getDatabasesPath(),
          'controller.db'); // creat database in databasepath
      _db = await openDatabase(
        path,
        // When the database is first created, create a table to store produit.
        onCreate: initDB,

        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1,
      );

      return _db;
    } catch (e) {
      print('from createDatabase ==> $e');
    }
  }

  initDB(Database db, int version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE produit(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, dateProduction TEXT,jp INTEGER,proteine DOUBLE,cendres DOUBLE)',
    );
  }

  // Define a function that inserts produit into the database
  Future<void> creatProduit(ProduitFini produit) async {
    try {
      // Get a reference to the database.
      final Database db = await createDatabase();

      // Insert the produit into the correct table. You might also specify the
      // `conflictAlgorithm` to use in case the same produit is inserted twice.
      //
      // In this case, replace any previous data.
      await db.insert(
        'produit',
        produit.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('from creatProduit ==> $e');
    }
  }
  
  Future<void> updateProteine(ProduitFini produit) async {
    try {
      // Get a reference to the database.
      final Database db = await createDatabase();

      // Update the given produit.
      await db.update(
        'produit',
        produit.toMapProtiene(),
        // Ensure that the produit has a matching id.
        where: 'id = ?',
        // Pass the produit's id as a whereArg to prevent SQL injection.
        whereArgs: [produit.id],
      );
     
    } catch (e) {
      print('from creatProduit ==> $e');
    }
    // Get a reference to the database.
  }
  Future<void> updateCendres(ProduitFini produit) async {
    try {
      // Get a reference to the database.
      final Database db = await createDatabase();

      // Update the given produit.
      await db.update(
        'produit',
        produit.toMapCendres(),
        // Ensure that the produit has a matching id.
        where: 'id = ?',
        // Pass the produit's id as a whereArg to prevent SQL injection.
        whereArgs: [produit.id],
      );
     
    } catch (e) {
      print('from creatProduit ==> $e');
    }
    // Get a reference to the database.
  }
  Future<List<ProduitFini>> allProduit() async {
    try {
      // Get a reference to the database.
      final db = await createDatabase();

      // Query the table for all The produit.
      final List<Map<String, dynamic>> maps = await db.query('produit');

      // Convert the List<Map<String, dynamic> into a List<ProduitFini>.
      return List.generate(maps.length, (i) {
        return ProduitFini(
          id: maps[i]['id'],
          dateProduction: maps[i]['dateProduction'],
          jp: maps[i]['jp'],
          proteine: maps[i]['proteine'],
          cendres: maps[i]['cendres'],
        );
      });
    } catch (e) {
      print('from allProduit => $e');
    }

    return [];
  }
}
