abstract interface class ISecureStorageManager {
  Future<bool> saveData(String key, dynamic value);
  Future<String?> readData(String key);
  Future deleteData(String key);
}
