import 'BrandType.dart';

class BrandType {
  BrandType({
    required this.Brand,
  });
  late final List<Brands> Brand;

  BrandType.fromJson(Map<String, dynamic> json){
    Brand = List.from(json['Allresults']).map((e)=>Brands.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Allresults'] = Brand.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Brands {
  Brands({
    required this.Sno,
    required this.Name,
  });
  late final int Sno;
  late final String Name;

  Brands.fromJson(Map<String, dynamic> json){
    Sno = json['Sno'];
    Name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Sno'] = Sno;
    _data['Name'] = Name;
    return _data;
  }
}