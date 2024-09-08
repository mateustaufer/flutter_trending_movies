import 'package:get_storage/get_storage.dart';

import 'local_storage.dart';

class GetStorageImp implements LocalStorage {
  static const String storageContainer = 'app_data';

  @override
  Future<void> init() async {
    await GetStorage.init(storageContainer);
  }

  @override
  Future<void> save(String key, String value) async {
    await GetStorage(storageContainer).write(key, value);
  }

  @override
  Future<String?> read(String key) {
    return GetStorage(storageContainer).read(key);
  }

  @override
  Future<void> delete(String key) async {
    return await GetStorage(storageContainer).remove(key);
  }

  @override
  Future<void> clear() async {
    return await GetStorage(storageContainer).erase();
  }
}
