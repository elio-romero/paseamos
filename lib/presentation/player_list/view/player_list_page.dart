import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paseamos/presentation/player_list/cubit/player_list_cubit.dart';
import 'package:paseamos/presentation/player_list/view/player_list_view.dart';
import 'package:paseamos/repository/database_repository_impl.dart';

class PlayerListPage extends StatelessWidget {
  static const name = 'player-list';
  const PlayerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayerListCubit(DatabaseRepositoryImpl()),
      child: const PlayerListView(),
    );
  }
}
