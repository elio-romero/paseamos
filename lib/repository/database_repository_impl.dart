import 'package:paseamos/presentation/player_list/models/player.dart';
import 'package:paseamos/repository/database_repository.dart';
import 'package:paseamos/repository/database_service.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseService service = DatabaseService();

  @override
  List<Player> addPlayer(Player player) {
    return service.addPlayer(player);
  }

  @override
  List<Player> getPlayers() {
    return service.getPlayers();
  }

  @override
  List<Player> removerPlayer(int id) {
    return service.removerPlayer(id);
  }
}
