import '../model/entity/catalog.dart';
import '../model/repository/catalog.dart';

class CatalogController {
  late CatalogtRepository _catalogrepository;

  CatalogController() {
    _catalogrepository = CatalogtRepository();
  }

  Future<void> save(CatalogEntity catalog) async {
    await _catalogrepository.editCatalog(catalog);
  }
}