import 'package:equatable/equatable.dart';

/// Bloc state
final class ScoreState with EquatableMixin {
  const ScoreState(this.scoreTeam1, this.scoreTeam2);
  final int scoreTeam1;
  final int scoreTeam2;

  @override
  List<Object> get props => [scoreTeam1, scoreTeam2];

  @override
  String toString() => 'score: ($scoreTeam1, $scoreTeam2)';
}

final class ScoreInitial extends ScoreState {
  const ScoreInitial() : super(0, 0);
}
