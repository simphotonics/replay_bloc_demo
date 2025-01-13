import 'package:replay_bloc/replay_bloc.dart';

import 'score_event.dart';
import 'score_state.dart';

/// Bloc logic
class ScoreBloc extends ReplayBloc<MatchEvent, ScoreState> {
  ScoreBloc() : super(ScoreInitial()) {
    on<MatchEvent>((event, emit) => switch (event) {
          AwardPointTeam1() => emit(
              ScoreState(state.scoreTeam1 + 1, state.scoreTeam2),
            ),
          AwardPointTeam2() => emit(
              ScoreState(state.scoreTeam1, state.scoreTeam2 + 1),
            ),
          ReplayPoint() => emit(_replayPoint()),
        });
  }

  ScoreState _replayPoint() {
    undo();
    return state;
  }

  @override
  void onTransition(covariant Transition<ReplayEvent, ScoreState> transition) {
    super.onTransition(transition);
    print('onTransition -> handling event: ${transition.event.runtimeType}');
    
    if (transition.event is ReplayPoint) {
      print(
          '  Doing something during event ReplayPoint. '); // <-- Never reached.
    }
  }
}
