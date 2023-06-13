import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studet_clean_arch/core/failure/failure.dart';
import 'package:studet_clean_arch/features/batch/Data/data_source/batch_local_data_source.dart';
import 'package:studet_clean_arch/features/batch/Domain/entity/batch_entity.dart';
import 'package:studet_clean_arch/features/batch/Domain/repository/i_batch_repository.dart';

final batchLocalRepoProvider = Provider<IBatchRepository>((ref) {
  return BatchLocalRepositoryImpl(
    batchLocalDataSource: ref.read(batchLocalDataSourceProvider),
  );
});

class BatchLocalRepositoryImpl implements IBatchRepository {
  final BatchLocalDataSource batchLocalDataSource;

  BatchLocalRepositoryImpl({required this.batchLocalDataSource});

  @override
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    throw UnimplementedError();
  }
}
