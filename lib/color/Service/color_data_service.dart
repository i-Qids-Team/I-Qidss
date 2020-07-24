import 'package:iqidss/color/Models/colordbdata.dart';

import 'color_service.dart';

class ColorDataService {
  static final ColorDataService _instance = ColorDataService._constructor();
  factory ColorDataService() {
    return _instance;
  }

  ColorDataService._constructor();
  final rest = ColorService();

  Future<List<ColorDBData>> getAnimalList() async {
    final listJson = await rest.get('color');

    return (listJson as List)
        .map((itemJson) => ColorDBData.fromJson(itemJson))
        .toList();
  }

  Future<ColorDBData> updateAnimal({String id, int color}) async {
    final json = await rest.patch('color/$id', data: {'color': color});

    return ColorDBData.fromJson(json);
  }

  Future<ColorDBData> createColor({ColorDBData color}) async {
    final json = await rest.post('color/', data: color);

    return ColorDBData.fromJson(json);
  }

  Future<ColorDBData> deleteScore({String id}) async {
    final json = await rest.delete('color/$id');

    return ColorDBData.fromJson(json);
  }
}
