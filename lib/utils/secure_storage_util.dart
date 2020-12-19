import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  final _storage = FlutterSecureStorage();


  Future insertData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future getData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }
}