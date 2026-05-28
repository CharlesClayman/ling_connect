import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/room.dart';

abstract class CallRepository {
  Future<Either<Failure, Room>> createRoom(String roomName);
  Future<Either<Failure, Room>> joinRoom(String roomId);
}
