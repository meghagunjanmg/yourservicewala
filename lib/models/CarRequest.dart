class CarRequest {
  CarRequest({
    required this.MobileNo,
    required this.BrandId,
    required this.Modelno,
    required this.Registrationno,
    required this.InsuranceDate,
    required this.ragistrationDate,
    required this.CarType,
  });
  late final String MobileNo;
  late final int BrandId;
  late final String Modelno;
  late final String Registrationno;
  late final String InsuranceDate;
  late final String ragistrationDate;
  late final String CarType;

  CarRequest.fromJson(Map<String, dynamic> json){
    MobileNo = json['MobileNo'];
    BrandId = json['Brand_id'];
    Modelno = json['Modelno'];
    Registrationno = json['Registrationno'];
    InsuranceDate = json['InsuranceDate'];
    ragistrationDate = json['ragistrationDate'];
    CarType = json['CarType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MobileNo'] = MobileNo;
    _data['Brand_id'] = BrandId;
    _data['Modelno'] = Modelno;
    _data['Registrationno'] = Registrationno;
    _data['InsuranceDate'] = InsuranceDate;
    _data['ragistrationDate'] = ragistrationDate;
    _data['CarType'] = CarType;
    return _data;
  }
}