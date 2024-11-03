class Comment {
  final String uuid;
  final String roomUuid;
  final String body;
  final String talker;
  final String createdAt;

  Comment({
    required this.uuid,
    required this.roomUuid,
    required this.body,
    required this.talker,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      uuid: json['uuid'],
      roomUuid: json['room'],
      body: json['body'],
      talker: json['talker'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'room': roomUuid,
      'body': body,
      'talker': talker,
      'created_at': createdAt,
    };
  }
}
