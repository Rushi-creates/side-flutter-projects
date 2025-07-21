import 'dart:convert';

// import 'dart:convert';

// class NewStudent {
//   int id;
//   String name;
//   String email;
//   String address;
//   String phone;
//   String room_number;
//   String hostel_fees;
//   String mess_fees;
//   NewStudent({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.address,
//     required this.phone,
//     required this.room_number,
//     required this.hostel_fees,
//     required this.mess_fees,
//   });

//   NewStudent copyWith({
//     int? id,
//     String? name,
//     String? email,
//     String? address,
//     String? phone,
//     String? room_number,
//     String? hostel_fees,
//     String? mess_fees,
//   }) {
//     return NewStudent(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       address: address ?? this.address,
//       phone: phone ?? this.phone,
//       room_number: room_number ?? this.room_number,
//       hostel_fees: hostel_fees ?? this.hostel_fees,
//       mess_fees: mess_fees ?? this.mess_fees,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id.toString(),
//       'name': name,
//       'email': email,
//       'address': address,
//       'phone': phone,
//       'room_number': room_number,
//       'hostel_fees': hostel_fees,
//       'mess_fees': mess_fees,
//     };
//   }

//   factory NewStudent.fromMap(Map<String, dynamic> map) {
//     return NewStudent(
//       id: map['id']?.toInt() ?? 0,
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       address: map['address'] ?? '',
//       phone: map['phone'] ?? '',
//       room_number: map['room_number'] ?? '',
//       hostel_fees: map['hostel_fees'] ?? '',
//       mess_fees: map['mess_fees'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory NewStudent.fromJson(String source) =>
//       NewStudent.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'NewStudent(id: $id, name: $name, email: $email, address: $address, phone: $phone, room_number: $room_number, hostel_fees: $hostel_fees, mess_fees: $mess_fees)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is NewStudent &&
//         other.id == id &&
//         other.name == name &&
//         other.email == email &&
//         other.address == address &&
//         other.phone == phone &&
//         other.room_number == room_number &&
//         other.hostel_fees == hostel_fees &&
//         other.mess_fees == mess_fees;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         email.hashCode ^
//         address.hashCode ^
//         phone.hashCode ^
//         room_number.hashCode ^
//         hostel_fees.hashCode ^
//         mess_fees.hashCode;
//   }
// }

class Note {
  int id;
  String title;
  String body;
  int userId;
  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  Note copyWith({
    int? id,
    String? title,
    String? body,
    int? userId,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'title': title,
      'body': body,
      'userId': userId.toString(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      userId: map['userId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Note(id: $id, title: $title, body: $body, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note &&
        other.id == id &&
        other.title == title &&
        other.body == body &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ body.hashCode ^ userId.hashCode;
  }
}
