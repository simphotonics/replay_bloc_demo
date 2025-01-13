import 'package:replay_bloc_demo/replay_bloc_demo.dart';

void main(List<String> args) async {
  final bloc = ScoreBloc();

  bloc.add(AwardPointTeam1());
  bloc.add(AwardPointTeam2());
  bloc.add(ReplayPoint());
}
