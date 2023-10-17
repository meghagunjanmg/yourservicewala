class Carlist {
  Carlist({
    required this.CarsDetails,
  });
  late final List<CarsDetail> CarsDetails;

  Carlist.fromJson(Map<String, dynamic> json){
    CarsDetails = List.from(json['Allresults']).map((e)=>CarsDetail.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Allresults'] = CarsDetails.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CarsDetail {
  CarsDetail({
    required this.Manufacturer,
    required this.modelno,
    required this.Carno,
    required this.InsuranceDate,
    required this.ragistrationDate,
    required this.carType,
  });
  late final String Manufacturer;
  late final String modelno;
  late final String Carno;
  late final String InsuranceDate;
  late final String ragistrationDate;
  late final String carType;

  CarsDetail.fromJson(Map<String, dynamic> json){
    Manufacturer = json['Manufacturer'];
    modelno = json['modelno'];
    Carno = json['Carno'];
    InsuranceDate = json['InsuranceDate'];
    ragistrationDate = json['ragistrationDate'];
    carType = json['carType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Manufacturer'] = Manufacturer;
    _data['modelno'] = modelno;
    _data['Carno'] = Carno;
    _data['InsuranceDate'] = InsuranceDate;
    _data['ragistrationDate'] = ragistrationDate;
    _data['carType'] = carType;
    return _data;
  }
}