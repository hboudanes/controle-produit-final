import 'package:get/get.dart';
import '../databasehelper.dart';
import '../model/produitfini.dart';
import 'dart:io';

import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';

class SuiviProduitController extends GetxController {
  RxList<ProduitFini> produitFini = <ProduitFini>[].obs;
  // RxString? errortext = 'null'.obs;
  DatabaseHelper c = DatabaseHelper();

  RxList isExpanded = [false].obs;

  void initProduitFini() async {
    produitFini = <ProduitFini>[].obs;
    produitFini.addAll(await c.allProduit());
    print('-------');
    print(produitFini.length.toString());
    print(produitFini.length.toString());
    print('-------');
    for (var i = 0; i < produitFini.length - 1; i++) {
      isExpanded.add(false);
    }
  }

  void updateList(int index, double resultDouble, String type) {
    switch (type) {
      case "proteine":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).proteine = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      case "cendres":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).cendres = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      case "acidite":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).acidite = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      case "humidite":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).humidite = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      //matiereGrasse
      case "matiereGrasse":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).matiereGrasse = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      default:
        initProduitFini();
    }
  }

  Future<void> createExcel() async {
    if (await Permission.storage.request().isGranted) {
      DateTime tsdate = DateTime.now();
      String datetime = "suivi qualité prouit fini" + tsdate.year.toString() +
      "-" +
      tsdate.month.toString() +
      "-" +
      tsdate.day.toString() +
      "-" +
      tsdate.hour.toString() +
      "h" +
      tsdate.minute.toString() +
      "m" +
      tsdate.second.toString() +
      "s" +
      tsdate.millisecond.toString()+"ms";
      try {
        // Create a new Excel Document.
      final Workbook workbook = Workbook();

       // Accessing worksheet via index.
      final Worksheet sheet = workbook.worksheets[0];

      // Set the text value.
      for (var i = 0; i < produitFini.length; i++) {
        sheet.getRangeByName('A1').setText('date');
        sheet
            .getRangeByName('A${i + 2}')
            .setText(produitFini.elementAt(i).dateProduction);
        sheet.getRangeByName('B1').setText('J.P');
        sheet.getRangeByName('B${i + 2}').setValue(produitFini.elementAt(i).jp);
        sheet.getRangeByName('C1').setText('PROTEINE%');
        sheet
            .getRangeByName('C${i + 2}')
            .setNumber(produitFini.elementAt(i).proteine);
        sheet.getRangeByName('D1').setText('Matière Grasse%');
        sheet
            .getRangeByName('D${i + 2}')
            .setNumber(produitFini.elementAt(i).matiereGrasse);
        sheet.getRangeByName('E1').setText('CENDRES%');
        sheet
            .getRangeByName('E${i + 2}')
            .setNumber(produitFini.elementAt(i).cendres);
        sheet.getRangeByName('F1').setText('HUMIDITE%');
        sheet
            .getRangeByName('F${i + 2}')
            .setNumber(produitFini.elementAt(i).humidite);
        sheet.getRangeByName('G1').setText('Acidité% ');
        sheet
            .getRangeByName('G${i + 2}')
            .setNumber(produitFini.elementAt(i).acidite);
      }

// Save and dispose the document.
      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      var path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
      String dir = path + "/$datetime.xlsx";

      File file = File(dir);

      await file.writeAsBytes(bytes, flush: true);
      } catch (e) {
        print('export excel err:$e');
      }
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }

  deleteProduitd(int parmID, int index) async {
    print('$parmID');
    await c.deleteProduit(parmID);
    produitFini.removeAt(index);
  }

  Future updatehumidite(int parmID, double resultDouble) async {
    print('hello');
    var fido = ProduitFini(
      id: parmID,
      humidite: resultDouble,
    );
    await c.updateHumidite(fido);
  }

  @override
  void onInit() async {
    initProduitFini();
    super.onInit();
  }
}
