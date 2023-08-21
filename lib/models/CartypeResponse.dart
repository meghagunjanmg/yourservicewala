import 'CartypeResponse.dart';

class CartypeResponse {
  CartypeResponse({
    required this.Cartypes,
  });
  late final List<Cartype> Cartypes;

  CartypeResponse.fromJson(Map<String, dynamic> json){
    Cartypes = List.from(json['Allresults']).map((e)=>
        Cartype.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Allresults'] = Cartypes.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Cartype {

  late final int Sno;
  late final String CarName;

  Cartype(this.Sno, this.CarName);

  Cartype.fromJson(Map<String, dynamic> json){
    Sno = json['Sno'];
    CarName = json['CarName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Sno'] = Sno;
    _data['CarName'] = CarName;
    return _data;
  }
}