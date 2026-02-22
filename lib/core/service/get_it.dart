import 'package:get_it/get_it.dart';
import 'package:product_dashboard/core/service/data_base_service.dart';
import 'package:product_dashboard/core/service/storage_service.dart';
import 'package:product_dashboard/feature/add_product/data/repos/product_repo_impl.dart';
import 'package:product_dashboard/feature/add_product/domain/repos/producr_repo_decl.dart';

final getit = GetIt.instance;

void setUpGetit() {
  getit.registerLazySingleton<StorageService>(() => (SupaStorage()));
  getit.registerLazySingleton<DataBaseService>(() => (FireStoreService()));
  getit.registerLazySingleton<ProducrRepoDecl>(
    () => (ProductRepoImpl(getit.get<DataBaseService>())),
  );
  getit.registerLazySingleton<UploadImageDecl>(
    () => (ImageUpload(storageService: getit.get<StorageService>())),
  );
}
