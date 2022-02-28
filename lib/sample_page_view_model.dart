import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_page_view_model.freezed.dart';

final samplePageViewModelProvider =
    StateNotifierProvider.autoDispose<SamplePageViewModel, SamplePageState>(
        (ref) => SamplePageViewModel());

@freezed
class SamplePageState with _$SamplePageState {
  factory SamplePageState({@Default(0) int counter}) = _SamplePageState;
}

class SamplePageViewModel extends StateNotifier<SamplePageState> {
  SamplePageViewModel() : super(SamplePageState());

  void incrementCounter() {
    state = state.copyWith(counter: state.counter + 1);
  }
}
