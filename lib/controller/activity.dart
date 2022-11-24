import '../model/entity/activity.dart';
import '../model/repository/activity.dart';

class ActivityController {
  late ActivityRepository _repository;


   ActivityController() {
    _repository = ActivityRepository();
  }

 Future<void> saveActivity(ActivityEntity activity) async {   
    await _repository.addActivity(activity);
  }

  Future<List<ActivityEntity>> listAll(String id) async {
    return await _repository.getAllByUserId(id);
  }






}
