import 'dart:developer';

import 'package:bitsgap_tt/domain/main_repository.dart';
import 'package:either_dart/either.dart';

import 'core/dio_client.dart';
import 'models/characters_info/characters_info.dart';

class MainRepository implements IMainRepository {
  @override
  Future<Either<String, CharactersInfo>> fetchCharactersInfo() async {
    try {
      final response = await DioClient().dio.get('api/character');
      final result = CharactersInfo.fromJson(response.data);
      return Right(result);
    } catch (e, s) {
      log('Error fetching characters info $e, and stack trace $s');
      return Left('Something went wrong on fetching characters info');
    }
  }
}
