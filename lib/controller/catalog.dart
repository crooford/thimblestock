import '../model/entity/catalog.dart';
import '../model/repository/catalog.dart';

class CatalogController {
  late CatalogRepository _catalogrepository;

  CatalogController() {
    _catalogrepository = CatalogRepository();
  }

  Future<void> save(CatalogEntity catalog) async {
    await _catalogrepository.editCatalog(catalog);
  }
  Future<List<CatalogEntity>> listAll(String id) async {
    return await _catalogrepository.getAllByUserId(id);
  }
}