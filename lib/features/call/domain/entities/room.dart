import 'package:equatable/equatable.dart';

class Room extends Equatable {
  final String roomId;
  final String roomName;

  const Room({required this.roomId, required this.roomName});

  @override
  List<Object?> get props => [roomId, roomName];
}
