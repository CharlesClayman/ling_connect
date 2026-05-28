import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room.dart';
import '../repositories/call_repository.dart';

class JoinRoomUseCase {
  final CallRepository repository;

  JoinRoomUseCase(this.repository);

  Future<Either<Failure, Room>> call(String roomId) async {
    return await repository.joinRoom(roomId);
  }
}
