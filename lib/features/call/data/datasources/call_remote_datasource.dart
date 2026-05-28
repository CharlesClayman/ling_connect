import '../models/room_model.dart';

abstract class CallRemoteDataSource {
  Future<RoomModel> createRoom(String roomName);
  Future<RoomModel> joinRoom(String roomId);
}

class CallRemoteDataSourceImpl implements CallRemoteDataSource {
  @override
  Future<RoomModel> createRoom(String roomName) async {
    await Future.delayed(const Duration(seconds: 1));
    return RoomModel(roomId: 'room_${DateTime.now().millisecondsSinceEpoch}', roomName: roomName);
  }

  @override
  Future<RoomModel> joinRoom(String roomId) async {
    await Future.delayed(const Duration(seconds: 1));
    return RoomModel(roomId: roomId, roomName: 'Joined Room');
  }
}
