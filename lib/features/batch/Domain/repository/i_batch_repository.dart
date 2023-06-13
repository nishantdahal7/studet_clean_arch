import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studet_clean_arch/core/failure/failure.dart';
import 'package:studet_clean_arch/features/batch/Data/repository/batch_local_repository_impl.dart';
import 'package:studet_clean_arch/features/batch/Domain/entity/batch_entity.dart';

final batchRepositoryProvder = Provider((ref) {
  //Return local repo implementation
  //For internet connectivity we will check later
  return ref.read(batchLocalRepoProvider);
});

abstract class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
}
