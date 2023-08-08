class ProfileResponse {
  ProfileResponse({
    this.referalID,
    required this.Name,
    required this.MobileNo,
    required this.UserPassword,
    required this.EmailID,
    required this.userAddress,
    this.PV,
  });
  late final Null referalID;
  late final String Name;
  late final String MobileNo;
  late final String UserPassword;
  late final String EmailID;
  late final String userAddress;
  late final Null PV;

  ProfileResponse.fromJson(Map<String, dynamic> json){
    referalID = null;
    Name = json['Name'];
    MobileNo = json['MobileNo'];
    UserPassword = json['UserPassword'];
    EmailID = json['EmailID'];
    userAddress = json['userAddress'];
    PV = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['referal_ID'] = referalID;
    _data['Name'] = Name;
    _data['MobileNo'] = MobileNo;
    _data['UserPassword'] = UserPassword;
    _data['EmailID'] = EmailID;
    _data['userAddress'] = userAddress;
    _data['PV'] = PV;
    return _data;
  }
}