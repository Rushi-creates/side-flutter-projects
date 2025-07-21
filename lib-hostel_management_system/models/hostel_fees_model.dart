class HostelFeesModel {
  int? id;
  String studentName;
  bool isFeesPaid;
  String paymentDate;

  HostelFeesModel({
    this.id,
    required this.studentName,
    required this.isFeesPaid,
    required this.paymentDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentName': studentName,
      'isFeesPaid': isFeesPaid,
      'paymentDate': paymentDate,
    };
  }

  factory HostelFeesModel.fromMap(Map<String, dynamic> map) {
    return HostelFeesModel(
      id: map['id'],
      studentName: map['studentName'],
      isFeesPaid: map['isFeesPaid'],
      paymentDate: map['paymentDate'],
    );
  }
}
