import 'package:thimblestock/model/entity/clients.dart';
import 'package:thimblestock/model/repository/client.dart';

class ClientController {
  late ClientRepository _repository;

  ClientController() {
    _repository = ClientRepository();
  }

  Future<void> save(ClientEntity client) async {
    await _repository.editClient(client);
  }

  Future<List<ClientEntity>> listAll(String id) async {
    return await _repository.getAllByUserId(id);
  }
}
