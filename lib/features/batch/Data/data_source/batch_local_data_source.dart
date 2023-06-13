import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studet_clean_arch/core/failure/failure.dart';
import 'package:studet_clean_arch/core/network/hive_service.dart';
import 'package:studet_clean_arch/features/batch/Data/model/batch_hive_model.dart';
import 'package:studet_clean_arch/features/batch/Domain/entity/batch_entity.dart';

final batchLocalDataSourceProvider = Provider<BatchLocalDataSource>((ref) {
  return BatchLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    batchHiveModel: ref.read(batchHiveModelProvider),
  );
});

class BatchLocalDataSource {
  final HiveService hiveService;
  final BatchHiveModel batchHiveModel;

  BatchLocalDataSource({
    required this.hiveService,
    required this.batchHiveModel,
  });

  //Add Batch
  Future<Either<Failure, bool>> addBatch(BatchEntity batch) async {
    try {
      //Convert entity to hive object
      final hiveBatch = batchHiveModel.toHiveModel(batch);
      //Add to hive
      await hiveService.addBatch(hiveBatch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      //Get all batches from hive
      final batches = await hiveService.getAllBatches();
      //convert hive object to entity
      final batchesEntities = batchHiveModel.toEntityList(batches);
      return Right(batchesEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
