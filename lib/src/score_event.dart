import 'package:replay_bloc/replay_bloc.dart';

/// Bloc events
sealed class MatchEvent extends ReplayEvent {}

sealed class AwardPoint extends MatchEvent {}

final class AwardPointTeam1 extends AwardPoint{}

final class AwardPointTeam2 extends AwardPoint {}

final class ReplayPoint extends MatchEvent {}
