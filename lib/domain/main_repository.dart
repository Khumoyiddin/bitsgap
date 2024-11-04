import 'package:bitsgap_tt/infrastructure/models/characters_info/characters_info.dart';
import 'package:either_dart/either.dart';

abstract class IMainRepository {
  Future<Either<String, CharactersInfo>> fetchCharactersInfo();
}
