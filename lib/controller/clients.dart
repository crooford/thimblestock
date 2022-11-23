import 'dart:math';

import '../model/entity/clients.dart';
import '../model/repository/client.dart';
import '../model/repository/fb_storage.dart';

class ClientController {
  late ClientRepository _repository;
  late FirebaseStorageRepository _storageRepository;

  ClientController() {
    _repository = ClientRepository();
    _storageRepository = FirebaseStorageRepository();
  }

  Future<void> save(ClientEntity client) async {
  

    // si el cliente tiene foto
    if (client.clientAvatar != null) {

      var url = await _storageRepository.uploadFile(client.clientAvatar!,
          "${client.user}/client/avatar");
      // cambio la direccion de la foto por la del storage
      client.clientAvatar = url;
    }

    await _repository.editClient(client);
  }

  Future<List<ClientEntity>> listAll(String id) async {
    return await _repository.getAllByUserId(id);
  }

  Future<void> update(ClientEntity client) async {
    return;
  }

  Future<void> deleteclient(String? clientId) async {
    return await _repository.deleteClientById(clientId);
  }
}
