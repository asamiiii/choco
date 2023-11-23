class Announcment {
  String? id;
  String? txt;

  Announcment({this.id, this.txt});

  factory Announcment.fromJson(Map<String, dynamic> map) {
    return Announcment(id: map['id'] ?? '', txt: map['txt'] ?? '');
  }

     Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'txt':txt
    };
  }
}
