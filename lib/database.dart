import 'package:dosage/model/produitfini.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Deze {
  static Database? _db;

  createDatabase() async {
    if (_db != null) {
      print('is null');
      return _db;
    }
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    // join('path', 'to', 'foo'); // -> 'path/to/foo' selon paltorme
    String path = join(await getDatabasesPath(),
        'controllr.db'); // creat database in databasepath
    print('path is creat');
    _db = await openDatabase(
      path,
      // When the database is first created, create a table to store produit.
      onCreate: initDB,

      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    print('database is creat');
  }

  initDB(Database db, int version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE produit(id INTEGER PRIMARY KEY, dateProduction TEXT, jp INTEGER)',
    );
  }

  // Define a function that inserts produit into the database
  Future<void> creatProduit(ProduitFini produit) async {
    print('enter creatProduit');
    // Get a reference to the database.
    final Database db = await createDatabase();
    
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'produit',
      produit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProduitFini>> allProduit() async {
    print('enter allproduit');
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
      );
    });
  }
}
