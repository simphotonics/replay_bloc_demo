import 'dart:math';

import 'package:replay_bloc_demo/replay_bloc_demo.dart';

final rand = Random();

void main(List<String> args) async {
  final bloc = ScoreBloc();

  for (var i = 0; i < 10; i++) {
    final event = rand.nextBool() ? AwardPointTeam1() : AwardPointTeam2();
    bloc.add(event);
  }

  for (var i = 0; i < 10; i++) {
    bloc.add(ReplayPoint());
  }
}
