class Announcment {
  String? id;
  String? txt;
  String? branch;

  Announcment({this.id, this.txt,this.branch});

  factory Announcment.fromJson(Map<String, dynamic> map) {
    return Announcment(id: map['id'] ?? '', txt: map['txt'] ?? '',branch: map['branch']);
  }

     Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'txt':txt,
      'branch':branch
    };
  }
}
