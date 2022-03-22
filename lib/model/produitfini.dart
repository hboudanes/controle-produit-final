class ProduitFini {
  final int? id;
  final String? dateProduction;
  final int? jp;
  double? proteine;
  double? matiereGrasse;
  double? cendres;
  double? humidite;
  double? acidite;
  ProduitFini({
    this.dateProduction,
    this.id,
    this.jp,
    this.proteine,
    this.matiereGrasse,
    this.cendres,
    this.humidite,
    this.acidite,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateProduction': dateProduction,
      'jp': jp,
    };
  }
  Map<String, dynamic> toMapProtiene() {
    return {
      'id': id,
      'proteine': proteine,
    };
  }

  Map<String, dynamic> toMapCendres() {
    return {
      'id': id,
      'cendres': cendres,
    };
  }
  Map<String, dynamic> toMapAcidite() {
    return {
      'id': id,
      'acidite': acidite,
    };
  }
  Map<String, dynamic> toMapHumidite() {
    return {
      'id': id,
      'humidite': humidite,
    };
  }
  Map<String, dynamic> toMapMatiereGrasse() {
    return {
      'id': id,
      'matiereGrasse': matiereGrasse,
    };
  }
  
  // @override
  // String toString() {
  //   return 'produits{id: $id, name: $dateProduction, age: $jp}';
  // }
}
