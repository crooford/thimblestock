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
      case "createProject":
        activity.typeOfActivity = "Creaste el proyecto";
        break; // The switch statement must be told to exit, or it will execute every case.
      case "updateProject":
        activity.typeOfActivity = "Actualizaste el proyecto";
        break;
      case "deleteProject":
        activity.typeOfActivity = "Borraste el proyecto";
        break;
      case "createCatalog":
        activity.typeOfActivity = "Creaste el catalogo";
        break; // The switch statement must be told to exit, or it will execute every case.
      case "updateCatalog":
        activity.typeOfActivity = "Actualizaste el catalogo";
        break;
      case "deleteCatalog":
        activity.typeOfActivity = "Borraste el catalogo";
        break;
      case "addImage":
        activity.typeOfActivity = "Actualizaste una imagen en";
        break;
      case "deleteImage":
        activity.typeOfActivity = "Borraste una imagen en";
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
