import '../model/vegetableModel.dart';
import 'vegetable_rest_service.dart';

class VegetableDataService {
  static final VegetableDataService _instance =
      VegetableDataService._constructor();

  factory VegetableDataService() {
    return _instance;
  }

  VegetableDataService._constructor();
  final restVege = RestService();

  //to get all Vegetable question
  Future<List<VegetableModel>> getAllVegetable() async {
    final listJson = await restVege.get('vegetable');

    return (listJson as List)
        .map((itemJson) => VegetableModel.fromJson(itemJson))
        .toList();
  }

//get one Vegetable Question
  Future<VegetableModel> getVegetableById({String id}) async {
    final json = await restVege.get('vegetable/$id');
    return VegetableModel.fromJson(json);
  }

//get first choice of answer
  Future<VegetableModel> getFirstChoice({String id, int firstChoice}) async {
    final json = await restVege.patch('vegetable$id', data: {'firstChoice': 1});
    return VegetableModel.fromJson(json);
  }

//get second choice of answer
  Future<VegetableModel> getSecondChoice({String id, int secondChoice}) async {
    final json =
        await restVege.patch('vegetable$id', data: {'secondChoice': 2});
    return VegetableModel.fromJson(json);
  }

//get answer scheme

}
//class VegetableDataService

final vegeDataService = VegetableDataService();
