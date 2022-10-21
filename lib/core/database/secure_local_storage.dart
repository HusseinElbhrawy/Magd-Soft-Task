// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// abstract class SecureLocalStorage {
//   Future<String?> readValue(String key);
//   Future<void> writeValue(String key, String value);
//   Future<void> deleteValue(String key);
//   Future<void> deleteAll();
// }

// class SecureLocalStorageImplementation implements SecureLocalStorage {
//   final FlutterSecureStorage  flutterSecureStorage;

//   SecureLocalStorageImplementation({required this.flutterSecureStorage});
//   @override
//   Future<void> deleteAll() async {
//     return await flutterSecureStorage.deleteAll();
//   }

//   @override
//   Future deleteValue(key) async {
//     return await flutterSecureStorage.delete(key: key);
//   }

//   @override
//   Future<String?> readValue(String key) async {
//     return await flutterSecureStorage.read(key: key);
//   }

//   @override
//   Future<void> writeValue(String key, String value) async {
//     return await flutterSecureStorage.write(key: key, value: value);
//   }
// }
