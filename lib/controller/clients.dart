import '../model/entity/clients.dart';
import '../model/repository/client.dart';
import '../model/repository/fb_storage.dart';

class ClientController {
  late ClientRepository _repository;
  late FirebaseStorageRepository _storageRepository;
  final String defaultAvatar =
      'https://firebasestorage.googleapis.com/v0/b/thimblestock1.appspot.com/o/clientDefault.jpg?alt=media&token=938d2907-f7d7-48f5-ae90-0f0d7eae8044';

  ClientController() {
    _repository = ClientRepository();
    _storageRepository = FirebaseStorageRepository();
  }

  Future<void> save(ClientEntity client) async {
    // si el cliente tiene foto

    if (client.clientAvatar != null &&
        !client.clientAvatar!.startsWith("http")) {
      var url = await _storageRepository.uploadFile(
          client.clientAvatar!, "${client.user}/client/avatar");
      // cambio la direccion de la foto por la del storage
      client.clientAvatar = url;
    }

    await _repository.editClient(client);
  }

  Future<List<ClientEntity>> listAll(String id) async {
    return await _repository.getAllByUserId(id);
  }

  Future<void> deleteclient(String? clientAvatar, String? clientId) async {
/*    if (clientAvatar != defaultAvatar) {

      await _storageRepository.deleteFile(clientAvatar!);
    }  */

    return await _repository.deleteClientById(clientId);
  }
}
