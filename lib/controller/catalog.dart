

class CatalogController {
  late Catalogepository _repository;

  ClientController() {
    _repository = CatalogRepository();
  }

  Future<void> save(CatalogEntity client) async {
    await _repository.editClient(client);
  }
}