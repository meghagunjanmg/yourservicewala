class CarRequest {
  CarRequest({
    required this.MobileNo,
    required this.Carname,
    required this.Modelno,
    required this.modelyear,
    required this.CarNumber,
    required this.Registrationno,
    required this.InsuranceDate,
    required this.ragistrationDate,
    required this.CarType,
  });
  late final String MobileNo;
  late final String Carname;
  late final String Modelno;
  late final String modelyear;
  late final String CarNumber;
  late final String Registrationno;
  late final String InsuranceDate;
  late final String ragistrationDate;
  late final String CarType;

  CarRequest.fromJson(Map<String, dynamic> json){
    MobileNo = json['MobileNo'];
    Carname = json['Carname'];
    Modelno = json['Modelno'];
    modelyear = json['modelyear'];
    CarNumber = json['CarNumber'];
    Registrationno = json['Registrationno'];
    InsuranceDate = json['InsuranceDate'];
    ragistrationDate = json['ragistrationDate'];
    CarType = json['CarType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MobileNo'] = MobileNo;
    _data['Carname'] = Carname;
    _data['Modelno'] = Modelno;
    _data['modelyear'] = modelyear;
    _data['CarNumber'] = CarNumber;
    _data['Registrationno'] = Registrationno;
    _data['InsuranceDate'] = InsuranceDate;
    _data['ragistrationDate'] = ragistrationDate;
    _data['CarType'] = CarType;
    return _data;
  }
}