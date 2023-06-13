import 'package:riverpod/riverpod.dart';
import 'package:studet_clean_arch/features/batch/Domain/entity/batch_entity.dart';
import 'package:studet_clean_arch/features/batch/Domain/use_case/batch_use_case.dart';
import 'package:studet_clean_arch/features/batch/Presentation/state/batch_state.dart';

class BatchViewModel extends StateNotifier<BatchState> {
  final BatchUseCase batchUseCase;

  BatchViewModel(this.batchUseCase) : super(BatchState.initial()) {
    getAllBatches();
  }

  Future<void> addBatch(BatchEntity batch) async {
    state.copyWith(isLoading: true);
    var data = await batchUseCase.addBatch(batch);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  Future<void> getAllBatches() async {
    state = state.copyWith(isLoading: true);
    var data = await batchUseCase.getAllBatches();

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, batches: r),
    );
  }
}
