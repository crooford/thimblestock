import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../entity/activity.dart';

class ActivityRepository {
  late final CollectionReference _collection;

  // _clients = <String, ClientEntity>{};

  ActivityRepository() {
    _collection = FirebaseFirestore.instance.collection("activities");
  }

  Future<void> addActivity(ActivityEntity activity) async {
    var date = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd - kk:mm:ss').format(date);
    activity.timeOfActivity = formattedDate;
    String activ = activity.typeOfActivity!;
    switch (activ) {
      case "createClient":
        activity.typeOfActivity = "Creaste al cliente";
        break; // The switch statement must be told to exit, or it will execute every case.
      case "updateClient":
        activity.typeOfActivity = "Actualizaste al cliente";
        break;
      case "deleteClient":
        activity.typeOfActivity = "Borraste al cliente";
        break;
      case "createProyect":
        activity.typeOfActivity = "Creaste el proyecto";
        break; // The switch statement must be told to exit, or it will execute every case.
      case "updateProyect":
        activity.typeOfActivity = "Actualizaste el proyecto";
        break;
      case "deleteProyect":
        activity.typeOfActivity = "Borraste el proyecto";
        break;
      default:
        activity.typeOfActivity = "Actividad desconocida";
    }
    _collection
        .withConverter<ActivityEntity>(
            fromFirestore: ActivityEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(activity);
  }

  Future<List<ActivityEntity>> getAllByUserId(String id) async {
    var query = await _collection
        .where("user", isEqualTo: id)
        .orderBy("timeOfActivity", descending: true)
        .limit(20)
        .withConverter<ActivityEntity>(
            fromFirestore: ActivityEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .get();

    var activities = query.docs.cast().map<ActivityEntity>((e) {
      var activity = e.data();
      activity.user = e.id;
      return activity;
    });
    // clients.sort((a, b) => a.clientName.compareTo(b.clientName));

    return activities.toList();
  }
}
