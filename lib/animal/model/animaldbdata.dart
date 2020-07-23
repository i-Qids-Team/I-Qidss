class AnimalDBData {
  // String id;
  String name;
  double height;

  AnimalDBData({this.name, this.height});

  // AnimalDBData.copy(AnimalDBData from)
  //     : this(id: from.id, name: from.name, height: from.height);

  AnimalDBData.fromJson(Map<String, dynamic> json)
      : this(name: json['name'], height: json['height']);

  Map<String, dynamic> toJson() => {'name': name, 'height': height};
}
