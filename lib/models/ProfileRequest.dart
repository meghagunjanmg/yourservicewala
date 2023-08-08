class ProfileRequest {
  ProfileRequest({
    required this.Name,
    required this.MobileNo,
    required this.EmailID,
    required this.userAddress,
  });
  late final String Name;
  late final String MobileNo;
  late final String EmailID;
  late final String userAddress;

  ProfileRequest.fromJson(Map<String, dynamic> json){
    Name = json['Name'];
    MobileNo = json['MobileNo'];
    EmailID = json['EmailID'];
    userAddress = json['userAddress'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Name'] = Name;
    _data['MobileNo'] = MobileNo;
    _data['EmailID'] = EmailID;
    _data['userAddress'] = userAddress;
    return _data;
  }
}