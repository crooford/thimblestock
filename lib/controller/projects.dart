import 'package:thimblestock/model/entity/projects.dart';
import 'package:thimblestock/model/repository/project.dart';

class ProjectController {
  late ProjectRepository _repository;

  ProjectController() {
    _repository = ProjectRepository();
  }

  Future<void> save(ProjectEntity project) async {
    await _repository.editProject(project);
  }

  Future<List<ProjectEntity>> listAll(String id) async {
    return await _repository.getAllByUserId(id);
  }
}
