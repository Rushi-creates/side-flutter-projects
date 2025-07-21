class MessFessModel {
  int? id;
  String studentName;
  bool isFeesPaid;
  String paymentDate;
  MessFessModel({
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

  factory MessFessModel.fromMap(Map<String, dynamic> map) {
    return MessFessModel(
      id: map['id'],
      studentName: map['studentName'],
      isFeesPaid: map['isFeesPaid'],
      paymentDate: map['paymentDate'],
    );
  }
}
