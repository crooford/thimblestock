import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimblestock/controller/activity.dart';
import '../../model/entity/activity.dart';
import '../widgets/customAppBar.dart';

//import '../widgets/barraNavAbajo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ActivityEntity> _list = [];
  final _pref = SharedPreferences.getInstance();
  final _activityController = ActivityController();
  String _name = "";
  String _user = "";

  @override
  void initState() {
    super.initState();

    _listActivities();
    _pref.then((pref) {
      setState(() {
        _name = pref.getString("name") ?? "N/A";
        _user = pref.getString("uid") ?? "N/A";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(pageTitle: "Inicio"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFF17B890),
                    radius: 85,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/user_avatar.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Hola",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _name, //esto se debe reemplazar por el nombre del usuario
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Actividad reciente",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                      "${_list[index].typeOfActivity!} ${_list[index].detailOfActivity!}"),
                  subtitle: Text(_list[index].timeOfActivity!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _listActivities() {
    _pref.then((pref) {
      var id = pref.getString("uid") ?? "";
      _activityController.listAll(id).then((value) {
        setState(() {
          _list = value;
        });
      });
    });
  }
}
