import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room.dart';
import '../repositories/call_repository.dart';

class CreateRoomUseCase {
  final CallRepository repository;

  CreateRoomUseCase(this.repository);

  Future<Either<Failure, Room>> call(String roomName) async {
    return await repository.createRoom(roomName);
  }
}
