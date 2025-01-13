import 'package:replay_bloc/replay_bloc.dart';

import 'score_event.dart';
import 'score_state.dart';

/// Bloc logic
class ScoreBloc extends ReplayBloc<MatchEvent, ScoreState> {
  ScoreBloc() : super(ScoreInitial()) {
    on<MatchEvent>((event, emit) => switch (event) {
          AwardPointTeam1() => emit(
              ScoreState(state.scoreTeam1 + _pointValue, state.scoreTeam2),
            ),
          AwardPointTeam2() => emit(
              ScoreState(state.scoreTeam1, state.scoreTeam2 + _pointValue),
            ),
          ReplayPoint() => emit(_replayPoint()),
        });
  }

  int _pointValue = 1;

  ScoreState _replayPoint() {
    undo();
    return ScoreState(state.scoreTeam1, state.scoreTeam2);
  }

  @override
  void onTransition(covariant Transition<ReplayEvent, ScoreState> transition) {
    super.onTransition(transition);

    if (transition.event is ReplayPoint) {
      if ((transition.nextState.scoreTeam1 - transition.nextState.scoreTeam2)
              .abs() >
          1) {
        _pointValue = 2;
      }
    }

    print('$transition _pointValue: $_pointValue');
  }
}
