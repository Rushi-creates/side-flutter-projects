import 'dart:convert';

// class StudentModel {
//   // int? id;
//   //! changes here
//   String? id;
//   String? name;
//   String? email;
//   String? address;
//   String? phone;
//   String? room_number;
//   String? hostel_fees;
//   String? mess_fees;
//   StudentModel({
//     this.id,
//     this.name,
//     this.email,
//     this.address,
//     this.phone,
//     this.room_number,
//     this.hostel_fees,
//     this.mess_fees,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id.toString(),
//       // 'id': id,  //! changes made here for testing purposes
//       'name': name,
//       'email': email,
//       'address': address,
//       'phone': phone,
//       'room_number': room_number,
//       'hostel_fees': hostel_fees,
//       'mess_fees': mess_fees,
//     };
//   }

//   factory StudentModel.fromMap(Map<dynamic, dynamic> map) {
//     return StudentModel(
//       id: map['id'] ?? '', // try adding 'as int' - later
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       address: map['address'] ?? '',
//       phone: map['phone'] ?? '',
//       room_number: map['room_number'] ?? '',
//       hostel_fees: map['hostel_fees'] ?? '',
//       mess_fees: map['mess_fees'] ?? '',
//     );
//   }
// }

class StudentModel {
  String? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  String? room_number;
  String? hostel_fees;
  String? mess_fees;
  StudentModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.room_number,
    this.hostel_fees,
    this.mess_fees,
  });

  StudentModel copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
    String? phone,
    String? room_number,
    String? hostel_fees,
    String? mess_fees,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      room_number: room_number ?? this.room_number,
      hostel_fees: hostel_fees ?? this.hostel_fees,
      mess_fees: mess_fees ?? this.mess_fees,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'room_number': room_number, // remove this toString
      'hostel_fees': hostel_fees,
      'mess_fees': mess_fees,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      address: map['address'],
      phone: map['phone'],
      room_number: map['room_number'],
      hostel_fees: map['hostel_fees'],
      mess_fees: map['mess_fees'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentModel(id: $id, name: $name, email: $email, address: $address, phone: $phone, room_number: $room_number, hostel_fees: $hostel_fees, mess_fees: $mess_fees)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.room_number == room_number &&
        other.hostel_fees == hostel_fees &&
        other.mess_fees == mess_fees;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        room_number.hashCode ^
        hostel_fees.hashCode ^
        mess_fees.hashCode;
  }
}
