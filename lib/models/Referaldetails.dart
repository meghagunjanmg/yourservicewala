class Referaldetails {
  List<Allresults>? allresults;

  Referaldetails({this.allresults});

  Referaldetails.fromJson(Map<String, dynamic> json) {
    if (json['Allresults'] != null) {
      allresults = [];
      json['Allresults'].forEach((v) {
        allresults!.add(new Allresults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allresults != null) {
      data['Allresults'] = this.allresults!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allresults {
  dynamic name;
  dynamic mobileNo;
  dynamic emailID;
  dynamic userAddress;
  dynamic joinDate;
  dynamic status;
  dynamic description;

  Allresults(
      {this.name,
        this.mobileNo,
        this.emailID,
        this.userAddress,
        this.joinDate,
        this.status,
        this.description});

  Allresults.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    mobileNo = json['MobileNo'];
    emailID = json['EmailID'];
    userAddress = json['userAddress'];
    joinDate = json['JoinDate'];
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['MobileNo'] = this.mobileNo;
    data['EmailID'] = this.emailID;
    data['userAddress'] = this.userAddress;
    data['JoinDate'] = this.joinDate;
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}
