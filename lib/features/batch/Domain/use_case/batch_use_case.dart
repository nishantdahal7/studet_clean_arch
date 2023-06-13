import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studet_clean_arch/core/failure/failure.dart';
import 'package:studet_clean_arch/features/batch/Domain/entity/batch_entity.dart';
import 'package:studet_clean_arch/features/batch/Domain/repository/i_batch_repository.dart';

final batchUseCaseProvider = Provider<BatchUseCase>(
  (ref) => BatchUseCase(
    batchRepository: ref.read(batchRepositoryProvder),
  ),
);

class BatchUseCase {
  final IBatchRepository batchRepository;

  BatchUseCase({required this.batchRepository});

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() {
    return batchRepository.getAllBatches();
  }

  Future<Either<Failure, bool>> addBatch(BatchEntity batch) {
    return batchRepository.addBatch(batch);
  }
}
