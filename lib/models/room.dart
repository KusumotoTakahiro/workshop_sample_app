class Room {
  final String uuid;
  final String name;
  final String description;

  Room({
    required this.uuid,
    required this.name,
    required this.description,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      uuid: json['uuid'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'description': description,
    };
  }
}
