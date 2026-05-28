import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/room.dart';
import '../../domain/repositories/call_repository.dart';
import '../datasources/call_remote_datasource.dart';

class CallRepositoryImpl implements CallRepository {
  final CallRemoteDataSource remoteDataSource;

  CallRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Room>> createRoom(String roomName) async {
    try {
      final roomModel = await remoteDataSource.createRoom(roomName);
      return Right(roomModel);
    } catch (e) {
      return const Left(ServerFailure('Failed to create room'));
    }
  }

  @override
  Future<Either<Failure, Room>> joinRoom(String roomId) async {
    try {
      final roomModel = await remoteDataSource.joinRoom(roomId);
      return Right(roomModel);
    } catch (e) {
      return const Left(ServerFailure('Failed to join room'));
    }
  }
}
