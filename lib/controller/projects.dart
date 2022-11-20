import 'package:thimblestock/model/entity/projects.dart';
import 'package:thimblestock/model/repository/project.dart';

class ProjectController {
  late ProjectRepository _repository;

  ProjectController() {
    _repository = ProjectRepository();
  }

  Future<void> save(ProjectEntity client) async {
    await _repository.editProject(client);
  }
  Future<List<ProjectEntity>> listAll(String id) async {
    return await _repository.getAllByUserId(id);
  }
}