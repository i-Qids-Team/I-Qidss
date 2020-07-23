import 'package:iqidss/animal/model/animaldbdata.dart';
import 'animal_service.dart';

class AnimalDataService {
  static final AnimalDataService _instance = AnimalDataService._constructor();
  factory AnimalDataService() {
    return _instance;
  }

  AnimalDataService._constructor();
  final rest = AnimalService();

  Future<List<AnimalDBData>> getAnimalList() async {
    final listJson = await rest.get('animal');

    return (listJson as List)
        .map((itemJson) => AnimalDBData.fromJson(itemJson))
        .toList();
  }

  Future<AnimalDBData> updateAnimal({String id, int animal}) async {
    final json = await rest.patch('animal/$id', data: {'name': animal});

    return AnimalDBData.fromJson(json);
  }

  Future<AnimalDBData> createAnimal({AnimalDBData animal}) async {
    final json = await rest.post('animal/', data: animal);

    return AnimalDBData.fromJson(json);
  }

  Future<AnimalDBData> deleteScore({String id}) async {
    final json = await rest.delete('animal/$id');

    return AnimalDBData.fromJson(json);
  }
} // class AnimalDataService
