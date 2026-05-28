import '../../domain/entities/room.dart';

class RoomModel extends Room {
  const RoomModel({required super.roomId, required super.roomName});

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomId: json['roomId'],
      roomName: json['roomName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'roomName': roomName,
    };
  }
}
